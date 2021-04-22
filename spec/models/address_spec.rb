require 'rails_helper'
RSpec.describe "Addressモデル機能" ,type: :model do
  let(:user1){ FactoryBot.create(:user1) }
  describe 'バリデーションのテスト' do
    context 'バリデーションにひっかかる条件' do
      it 'postcodeがない場合' do
        address1 = FactoryBot.build(:address1, postcode: "")
        expect(address1).not_to be_valid
      end
      it 'prefecture_codeがない場合' do
        address1 = FactoryBot.build(:address1, prefecture_code: "")
        expect(address1).not_to be_valid
      end
      it 'cityがない場合' do
        address1 = FactoryBot.build(:address1, city: "")
        expect(address1).not_to be_valid
      end
      it 'address1がない場合' do
        address1 = FactoryBot.build(:address1, address1: "")
        expect(address1).not_to be_valid
      end
    end
    context 'バリデーションが通る条件' do
      it '空の入力部分がない' do
        address1 = FactoryBot.build(:address1, user_id: user1.id)
        expect(address1).to be_valid
      end
    end
  end
end
