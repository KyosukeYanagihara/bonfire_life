FactoryBot.define do
  factory :order, class: Order do
    status { 0 }
    rental_start { Time.now.since(20.day) }
    price { 4000 }
    rental_period { 1 }
    insurance_fee { 1 }
  end
end