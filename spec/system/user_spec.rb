require 'rails_helper'
RSpec.describe "ユーザー機能管理", type: :system do
  # let(:user1){ FactoryBot.create(:user1) }
  describe "ユーザー登録機能" do
    context "ユーザーを新規作成した場合" do
      it "topページに遷移する" do
        user = User.new(email: "test_user@example.com", password: "password", password_confirmation: "password")
        address = Address.new(postcode: 1234567, city: "test", address1: "1831-4", prefecture_code: "東京都", user_id: user.id)
        account = Account.new(first_name: "test", last_name: "test", first_name_kana: "test", last_name_kana: "test", birthday: Time.current.ago(20.year), sex: 1, contact_number: 12345678901)
        visit new_user_registration_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        fill_in 'user[password_confirmation]', with: user.password_confirmation
        fill_in 'user[account_attributes][last_name]', with: account.last_name
        fill_in 'user[account_attributes][first_name]', with: account.first_name
        fill_in 'user[account_attributes][last_name_kana]', with: account.last_name_kana
        fill_in 'user[account_attributes][first_name_kana]', with: account.first_name_kana
        fill_in 'user[address_attributes][postcode]', with: address.postcode
        fill_in 'user[address_attributes][address1]', with: "1456"
        fill_in 'user[account_attributes][birthday]', with: account.birthday
        select account.sex, from: 'user[account_attributes][sex]'
        fill_in 'user[account_attributes][contact_number]', with: account.contact_number
        click_button '会員登録'
        expect(page).to have_selector '.top_main'
        expect(page).to have_current_path root_path
      end
    end
  end
  describe "ログイン、ログアウト" do
    context "ログインした場合" do
      before do
        user1 = FactoryBot.create(:user1)
        FactoryBot.create(:account1, user_id: user1.id)
        visit new_user_session_path
        fill_in "user[email]",	with: user1.email
        fill_in "user[password]", with: user1.password
        click_button "ログイン"
        sleep(1)
      end
      it "topページに遷移する" do
        expect(page).to have_selector '.top_main'
        expect(page).to have_current_path root_path
      end
      it "ログアウトできる" do
        click_on "ログアウト"
        sleep(1)
        expect(page).not_to have_content "レンタル履歴"
        expect(page).to have_current_path root_path
      end
    end
  end
end
