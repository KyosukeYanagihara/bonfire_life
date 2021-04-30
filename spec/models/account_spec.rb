require 'rails_helper'
RSpec.describe "Accountモデル機能", type: :model do
  let(:user1){ FactoryBot.create(:user1) }
  describe 'バリデーションのテスト' do
    context "バリデーションに引っかかる条件" do
      it 'first_nameが空の場合' do
        account1 = FactoryBot.build(:account1, user_id: user1.id, first_name: "")
        expect(account1).not_to be_valid
      end
      it 'last_nameが空の場合' do
        account1 = FactoryBot.build(:account1, user_id: user1.id, last_name: "")
        expect(account1).not_to be_valid
      end
      it 'first_name_kanaが空の場合' do
        account1 = FactoryBot.build(:account1, user_id: user1.id, first_name_kana: "")
        expect(account1).not_to be_valid
      end
      it 'first_name_kanaがカタカナ以外の場合' do
        account1 = FactoryBot.build(:account1, user_id: user1.id, first_name_kana: "漢字")
        expect(account1).not_to be_valid
      end
      it 'last_name_kanaが空の場合' do
        account1 = FactoryBot.build(:account1, user_id: user1.id, last_name_kana: "")
        expect(account1).not_to be_valid
      end
      it 'last_name_kanaがカタカナ以外の場合' do
        account1 = FactoryBot.build(:account1, user_id: user1.id, last_name_kana: "漢字")
        expect(account1).not_to be_valid
      end
      it 'birthday空の場合' do
        account1 = FactoryBot.build(:account1, user_id: user1.id, birthday: "")
        expect(account1).not_to be_valid
      end
      it 'birthdayが未来日の場合' do
        account1 = FactoryBot.build(:account1, user_id: user1.id, birthday: Time.current.since(3.day))
        expect(account1).not_to be_valid
      end
      it 'birthdayが満16才になっていない場合' do
        account1 = FactoryBot.build(:account1, user_id: user1.id, birthday: Time.current.ago(15.year))
        expect(account1).not_to be_valid
      end
      it 'sexが空の場合' do
        account1 = FactoryBot.build(:account1, user_id: user1.id, sex: "")
        expect(account1).not_to be_valid
      end
      it 'contact_numberが空の場合' do
        account1 = FactoryBot.build(:account1, user_id: user1.id, contact_number: "")
        expect(account1).not_to be_valid
      end
    end
    context 'バリデーションが通る条件' do
      it '空の入力部分がない' do
        account1 = FactoryBot.build(:account1, user_id: user1.id)
        expect(account1).to be_valid
      end
    end
  end
end
