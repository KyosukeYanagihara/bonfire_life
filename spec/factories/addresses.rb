FactoryBot.define do
  factory :address1, class: Address do
    postcode { 111111 }
    prefecture_code { 1 }
    city { "address1" }
    address1 { "address1" }
    # association :user1
  end
end