require 'rails_helper'
RSpec.describe "お気に入り機能管理", type: :system do
  let!(:product1) {FactoryBot.create(:product1)}
  describe "お気に入り登録、削除異能" do
    context "お気に入り登録ボタンを押した場合" do
      it "お気に入り一覧に表示される" do
        user1 = FactoryBot.create(:user1)
        FactoryBot.create(:account1, user_id: user1.id)
        FactoryBot.create(:address1, user_id: user1.id)
        visit new_user_session_path
        fill_in "user[email]",	with: user1.email
        fill_in "user[password]", with: user1.password
        click_button "ログイン"
        sleep(1)
        visit product_path(product1.id)
        click_on "お気に入り登録"
        visit favorites_path
        expect(page).to have_content "name_product1"
        expect(page).to have_content "1000"
      end
    end
    context "お気に入り削除ボタンを押した場合" do
      it "お気に入り一覧に表示されないされる" do
        user1 = FactoryBot.create(:user1)
        FactoryBot.create(:account1, user_id: user1.id)
        FactoryBot.create(:address1, user_id: user1.id)
        FactoryBot.create(:favorite, user_id: user1.id, product_id: product1.id)
        visit new_user_session_path
        fill_in "user[email]",	with: user1.email
        fill_in "user[password]", with: user1.password
        click_button "ログイン"
        sleep(1)
        visit product_path(product1.id)
        click_on "お気に入り削除"
        visit favorites_path
        expect(page).not_to have_content "name_product1"
        expect(page).not_to have_content "1000"
      end
    end
  end
end
