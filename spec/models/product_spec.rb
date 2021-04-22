require 'rails_helper'
RSpec.describe "バリデーションのテスト" do
  let(:image_path) { Rails.root.join('spec/fixtures/test.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }
  context "バリデーションに引っかかる条件" do
    it 'nameが空の場合' do
      product1 = FactoryBot.build(:product1, name: "")
      expect(product1).not_to be_valid
    end
    it 'imagesが空の場合' do
      product1 = FactoryBot.build(:product1, images: "")
      expect(product1).not_to be_valid
    end
    it 'descriptionが空の場合' do
      product1 = FactoryBot.build(:product1, description: "")
      expect(product1).not_to be_valid
    end
    it 'rental_priceが空の場合' do
      product1 = FactoryBot.build(:product1, rental_price: "")
      expect(product1).not_to be_valid
    end
    it 'selling_priceが空の場合' do
      product1 = FactoryBot.build(:product1, selling_price: "")
      expect(product1).not_to be_valid
    end
    it 'sizeが空の場合' do
      product1 = FactoryBot.build(:product1, size: "")
      expect(product1).not_to be_valid
    end
    it 'weightが空の場合' do
      product1 = FactoryBot.build(:product1, weight: "")
      expect(product1).not_to be_valid
    end
    it 'imageが6枚の場合' do
      product1 = FactoryBot.build(:product1, images: [ image, image, image, image, image, image ])
      expect(product1).not_to be_valid
    end
  end
  context 'バリデーションが通る条件' do
    it '空の入力部分がない' do
      product1 = FactoryBot.build(:product1)
      expect(product1).to be_valid
    end
    it 'imageが1枚の場合' do
      product1 = FactoryBot.build(:product1, images: [ image ])
      expect(product1).to be_valid
    end
    it 'imageが2枚の場合' do
      product1 = FactoryBot.build(:product1, images: [ image, image ])
      expect(product1).to be_valid
    end
    it 'imageが3枚の場合' do
      product1 = FactoryBot.build(:product1, images: [ image, image, image ])
      expect(product1).to be_valid
    end
    it 'imageが4枚の場合' do
      product1 = FactoryBot.build(:product1, images: [ image, image, image, image ])
      expect(product1).to be_valid
    end
    it 'imageが5枚の場合' do
      product1 = FactoryBot.build(:product1, images: [ image, image, image, image, image ])
      expect(product1).to be_valid
    end
  end
end
