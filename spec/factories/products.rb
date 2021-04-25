FactoryBot.define do
  factory :product1, class: Product do
    name { "name_product1" }
    description { "description_product1" }
    rental_price { 1000 }
    selling_price { 3000 }
    size { "size_product1" }
    weight { 10 }
    images { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'spec/fixtures/test.jpg') ] }
  end
  factory :product2, class: Product do
    name { "name_product2" }
    description { "description_product2" }
    rental_price { 2000 }
    selling_price { 3000 }
    size { "size_product2" }
    weight { 10 }
    images { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'spec/fixtures/test.jpg') ] }
  end
  factory :product3, class: Product do
    name { "name_product3" }
    description { "description_product3" }
    rental_price { 3000 }
    selling_price { 3000 }
    size { "size_product3" }
    weight { 10 }
    images { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'spec/fixtures/test.jpg') ] }
  end
  factory :product4, class: Product do
    name { "name_product4" }
    description { "description_product4" }
    rental_price { 4000 }
    selling_price { 3000 }
    size { "size_product4" }
    weight { 10 }
    images { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg'), 'spec/fixtures/test.jpg') ] }
  end
end
