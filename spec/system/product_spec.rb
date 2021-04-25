require 'rails_helper'
RSpec.describe "商品機能管理", type: :system do
  let(:image_path) { Rails.root.join('spec/fixtures/test.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }
  describe "商品登録機能" do
    before do
      admin = FactoryBot.create(:admin)
      FactoryBot.create(:account_admin, user_id: admin.id)
      visit new_user_session_path
      fill_in "user[email]",	with: admin.email
      fill_in "user[password]", with: admin.password
      click_button "ログイン"
      sleep(1)
    end
    context "商品を新規作成した条場合" do
      it "作成した商品名が表示される" do
        product = Product.new(name: "test_name", description: "test_description", rental_price: 1000, selling_price: 3000, size: "test_size", weight: 30)
        visit new_product_path
        attach_file 'product_images', [ image_path ]
        fill_in "product[name]",	with: product.name
        fill_in "product[description]",	with: product.description
        fill_in "product[rental_price]",	with: product.rental_price
        fill_in "product[selling_price]",	with: product.selling_price
        fill_in "product[size]",	with: product.size
        fill_in "product[weight]",	with: product.weight
        click_on '作成'
        expect(page).to have_content "test_name"
      end
    end
  end
  describe "商品一覧機能" do
    let!(:product1) {FactoryBot.create(:product1)}
    let!(:product2) {FactoryBot.create(:product2)}
    let!(:product3) {FactoryBot.create(:product3)}
    context "一覧画面に遷移した場合" do
      it "商品一覧が表示される" do
        visit products_path
        expect(page).to have_content "product1"
        expect(page).to have_content "product2"
        expect(page).to have_content "product3"
      end
    end
    context "キーワード検索した場合" do
      it "一致する商品が表示される" do
        visit products_path
        fill_in "q_brand_or_name_cont",	with: "product1" 
        click_on "検索"
        sleep(1)
        expect(page).to have_content "product1"
        expect(page).not_to have_content "product2"
        expect(page).not_to have_content "product3"
      end
    end
    context "金額範囲検索した場合" do
      it "範囲内の商品が表示される" do
        visit products_path
        fill_in "q_rental_price_gteq",	with: 0
        fill_in "q_rental_price_lt",	with:  2500
        click_on "検索"
        expect(page).to have_content "product1"
        expect(page).to have_content "product2"
        expect(page).not_to have_content "product3"
      end
    end
    context "金額範囲とキーワード検索した場合" do
      it "一致した商品が表示される" do
        visit products_path
        fill_in "q_brand_or_name_cont",	with: "product" 
        fill_in "q_rental_price_gteq",	with: 0
        fill_in "q_rental_price_lt",	with:  2000
        click_on "検索"
        expect(page).to have_content "product1"
        expect(page).not_to have_content "product2"
        expect(page).not_to have_content "product3"
      end
    end
  end
  describe "詳細表示機能" do
    let!(:product1) {FactoryBot.create(:product1)}
    let!(:product2) {FactoryBot.create(:product2)}
    let!(:product3) {FactoryBot.create(:product3)}
    context "任意の商品詳細画像に遷移した場合" do
      it "該当商品の内容が表示される" do
        visit product_path(product1.id)
        expect(page).to have_content "description_product1"
      end
    end
  end
  describe "編集機能" do
    let!(:product1) {FactoryBot.create(:product1)}
    context "adminの場合" do
      it "編集できる" do
        admin = FactoryBot.create(:admin)
        FactoryBot.create(:account_admin, user_id: admin.id)
        visit new_user_session_path
        fill_in "user[email]",	with: admin.email
        fill_in "user[password]", with: admin.password
        click_button "ログイン"
        sleep(1)
        visit edit_product_path(product1.id)
        fill_in "product[name]",	with: "edit_product1" 
        click_on "編集"
        expect(page).to have_content "edit_product1"
        expect(page).not_to have_content "name_product1"
      end
    end
    context "一般ユーザーの場合" do
      it "topページに遷移する" do
        user1 = FactoryBot.create(:user1)
        FactoryBot.create(:account1, user_id: user1.id)
        visit new_user_session_path
        fill_in "user[email]",	with: user1.email
        fill_in "user[password]", with: user1.password
        click_button "ログイン"
        sleep(1)
        visit edit_product_path(product1.id)
        expect(page).to have_selector '.top_main', text: '炎'
      end
    end
  end
end
