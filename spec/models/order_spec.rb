require 'rails_helper'
RSpec.describe "Orderモデル機能", type: :model do
  let!(:user1){ FactoryBot.create(:user1) }
  describe "バリデーションのテスト" do
    context "バリデーションにひっかかる条件" do
      it "rental_startが空の場合" do
        order = FactoryBot.build(:order, user_id: user1.id, rental_start: "")
        expect(order).not_to be_valid
      end
      it "rental_startが6日後の場合" do
        order = FactoryBot.build(:order, user_id: user1.id, rental_start: Time.now.since(6.day))
        expect(order).not_to be_valid
      end
      it "rental_startが61日後の場合" do
        order = FactoryBot.build(:order, user_id: user1.id, rental_start: Time.now.since(61.day))
        expect(order).not_to be_valid
      end
      it "rental_periodが空の場合" do
        order = FactoryBot.build(:order, user_id: user1.id, rental_period: "")
        expect(order).not_to be_valid
      end
      it "insurance_feeが空の場合" do
        order = FactoryBot.build(:order, user_id: user1.id, insurance_fee: "")
        expect(order).not_to be_valid
      end
    end
    context "バリデーションが通る条件" do
      it "空の入力部分がない" do
        order = FactoryBot.build(:order, user_id: user1.id)
        expect(order).to be_valid
      end
      it "rental_startが7日後の場合" do
        order = FactoryBot.build(:order, user_id: user1.id, rental_start: Time.now.since(7.day))
        expect(order).to be_valid
      end
      it "rental_startが60日後の場合" do
        order = FactoryBot.build(:order, user_id: user1.id, rental_start: Time.now.since(60.day))
        expect(order).to be_valid
      end
    end
  end
end