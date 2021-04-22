FactoryBot.define do
  factory :account1, class: Account do
    first_name { "account1" }
    last_name { "account1" }
    first_name_kana { "account1" }
    last_name_kana { "account1" }
    birthday { Time.current }
    sex { 1 }
    contact_number { 11122223333 }
    admin { false }
  end
 end