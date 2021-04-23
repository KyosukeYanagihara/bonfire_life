require 'rails_helper'
RSpec.describe "カート機能管理", type: :system do
  let!(:product1) {FactoryBot.create(:product1)}
  let!(:product2) {FactoryBot.create(:product2)}
  let!(:product3) {FactoryBot.create(:product3)}
  describe "商品をカートに入れる機能" do
    context "カートに入れるをクリックした場合" do
      it "商品名と選択した個数が表示される" do
        user1 = FactoryBot.create(:user1)
        FactoryBot.create(:account1, user_id: user1.id)
        FactoryBot.create(:address1, user_id: user1.id)
        cart = FactoryBot.create(:cart, user_id: user1.id)
        visit new_user_session_path
        fill_in "user[email]",	with: user1.email
        fill_in "user[password]", with: user1.password
        click_button "ログイン"
        sleep(1)
        visit product_path(product1.id)
        select "2" , from: 'quantity'
        click_on "カートに入れる"
        expect(page).to have_content '2個'
        expect(page).to have_content "product1"
      end
    end
    context "すでにカートに商品がある場合" do
      before do
        user1 = FactoryBot.create(:user1)
        cart = FactoryBot.create(:cart, user_id: user1.id)
        FactoryBot.create(:account1, user_id: user1.id)
        FactoryBot.create(:address1, user_id: user1.id)
        FactoryBot.create(:cart_item, cart_id: cart.id, product_id: product1.id)
        visit new_user_session_path
        fill_in "user[email]",	with: user1.email
        fill_in "user[password]", with: user1.password
        click_button "ログイン"
        sleep(1)
      end
      it "同じ商品は指定した個数追加される" do
        visit product_path(product1.id)
        select "2" , from: 'quantity'
        click_on "カートに入れる"
        expect(page).to have_content '4個'
      end
      it "異なる商品は別途追加される" do
        visit product_path(product3.id)
        select "1" , from: 'quantity'
        click_on "カートに入れる"
        expect(page).to have_content '1個'
        expect(page).to have_content '2個'
        expect(page).to have_content "product1"
      end
    end
  end
  describe "カート一覧機能" do
    context "カート内に商品がない場合" do
      it "カート内に商品が無いことを示す" do
        user1 = FactoryBot.create(:user1)
        cart = FactoryBot.create(:cart, user_id: user1.id)
        FactoryBot.create(:account1, user_id: user1.id)
        FactoryBot.create(:address1, user_id: user1.id)
        visit new_user_session_path
        fill_in "user[email]",	with: user1.email
        fill_in "user[password]", with: user1.password
        click_button "ログイン"
        sleep(1)
        visit my_cart_carts_path
        expect(page).to have_content "現在カート内にレンタル用品はございません"
        expect(page).not_to have_content "レンタル手続きへ"
      end
    end
    context "個数を変更した場合" do
      it "指定した個数が表示される" do
        user1 = FactoryBot.create(:user1)
        cart = FactoryBot.create(:cart, user_id: user1.id)
        FactoryBot.create(:account1, user_id: user1.id)
        FactoryBot.create(:address1, user_id: user1.id)
        FactoryBot.create(:cart_item, cart_id: cart.id, product_id: product1.id)
        visit new_user_session_path
        fill_in "user[email]",	with: user1.email
        fill_in "user[password]", with: user1.password
        click_button "ログイン"
        sleep(1)
        visit my_cart_carts_path
        select "4", from: "quantity"
        click_on "変更"
        expect(page).to have_content "4個"
        expect(page).not_to have_content "2個"
      end
    end
    context "ログインしていない場合" do
      it "ログイン画面に遷移する" do
        visit my_cart_carts_path
        expect(page).to have_current_path new_user_session_path
      end
    end
  end 
    
end
