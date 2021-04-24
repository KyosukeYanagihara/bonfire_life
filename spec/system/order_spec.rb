require 'rails_helper'
RSpec.describe "注文機能管理" do
  let!(:product1) {FactoryBot.create(:product1)}
  let!(:product2) {FactoryBot.create(:product2)}
  let!(:product3) {FactoryBot.create(:product3)}
  describe "新規注文機能" do
    context "カート内に商品が無く、レンタル手続きボタンを押した場合" do
      it "商品一覧画面に遷移する" do
        user1 = FactoryBot.create(:user1)
        FactoryBot.create(:account1, user_id: user1.id)
        FactoryBot.create(:address1, user_id: user1.id)
        cart = FactoryBot.create(:cart, user_id: user1.id)
        visit new_user_session_path
        fill_in "user[email]",	with: user1.email
        fill_in "user[password]", with: user1.password
        click_button "ログイン"
        sleep(1)
        visit new_order_path
        expect(page).to have_current_path products_path  
      end
    end
    context "カート内に商品があり、レンタル手続きボタンを押した場合" do
      it "レンタル手続き画面に遷移する" do
        user1 = FactoryBot.create(:user1)
        FactoryBot.create(:account1, user_id: user1.id)
        FactoryBot.create(:address1, user_id: user1.id)
        cart = FactoryBot.create(:cart, user_id: user1.id)
        FactoryBot.create(:cart_item, cart_id: cart.id, product_id: product1.id)
        visit new_user_session_path
        fill_in "user[email]",	with: user1.email
        fill_in "user[password]", with: user1.password
        click_button "ログイン"
        sleep(1)
        visit new_order_path
        expect(page).to have_content "利用開始日・利用期間・用品保険の選択"
        expect(page).to have_current_path new_order_path 
      end
    end
    context "レンタル手続きをした場合" do
      before do
        user1 = FactoryBot.create(:user1)
        FactoryBot.create(:account1, user_id: user1.id)
        FactoryBot.create(:address1, user_id: user1.id)
        cart = FactoryBot.create(:cart, user_id: user1.id)
        FactoryBot.create(:cart_item, cart_id: cart.id, product_id: product1.id)
        visit new_user_session_path
        fill_in "user[email]",	with: user1.email
        fill_in "user[password]", with: user1.password
        click_button "ログイン"
        sleep(1)
        visit new_order_path
        select Time.now.since(20.day).strftime('%Y/%m/%d'), from: 'order_rental_start'
        select "4泊5日", from: 'order_rental_period'
        select "保険3000", from: 'order_insurance_fee'
        click_on "次へ"
      end
      it "確認画面に遷移する" do
        expect(page).to have_current_path confirm_orders_path 
        expect(page).to have_content "入力内容のご確認"
        expect(page).to have_content Time.now.since(20.day).strftime('%Y/%m/%d')
        expect(page).to have_content "4泊5日"
        expect(page).to have_content "保険3000"
      end
      it "仮予約完了画面へ遷移する" do
        click_on "仮予約する"
        expect(page).to have_current_path complete_orders_path 
        expect(page).to have_content "仮予約が完了しました"
      end
    end
  end
  describe "レンタル履歴一覧機能" do
    context "レンタル履歴がある場合" do
      it "レンタル履歴が表示される" do
        user1 = FactoryBot.create(:user1)
        FactoryBot.create(:account1, user_id: user1.id)
        FactoryBot.create(:address1, user_id: user1.id)
        order = FactoryBot.create(:order, user_id: user1.id)
        FactoryBot.create(:order_item, order_id: order.id, product_id: product1.id)
        visit new_user_session_path
        fill_in "user[email]",	with: user1.email
        fill_in "user[password]", with: user1.password
        click_button "ログイン"
        sleep(1)
        visit orders_path
        expect(page).to have_content "name_product1"
        expect(page).to have_content "2"
        expect(page).to have_content "3泊4日"
        expect(page).to have_content "用品保険1000"
        expect(page).to have_content "4000"
        expect(page).to have_content "仮予約"
      end
    end
    context "レンタル履歴が無い場合" do
      it "レンタル履歴が無いことが表示される" do
        user1 = FactoryBot.create(:user1)
        FactoryBot.create(:account1, user_id: user1.id)
        FactoryBot.create(:address1, user_id: user1.id)
        visit new_user_session_path
        fill_in "user[email]",	with: user1.email
        fill_in "user[password]", with: user1.password
        click_button "ログイン"
        sleep(1)
        visit orders_path
        expect(page).to have_content "現在レンタル履歴はございません。"  
      end
    end
  end
  
end
