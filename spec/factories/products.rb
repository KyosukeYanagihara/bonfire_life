FactoryBot.define do
  factory :product1, class: Product do
    name { "product1" }
    description { "product1" }
    rental_price { 1000 }
    selling_price { 3000 }
    size { "product1" }
    weight { 10 }
    images { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'spec/fixtures/test.jpg') ] }
  end
end
