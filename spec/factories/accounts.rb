FactoryBot.define do
  factory :account1, class: Account do
    first_name { "account1" }
    last_name { "account1" }
    first_name_kana { "account1" }
    last_name_kana { "account1" }
    birthday { Time.current.ago(20.year) }
    sex { 1 }
    contact_number { 11122223333 }
    admin { false }
  end
  factory :account_admin, class: Account do
    first_name { "admin_account" }
    last_name { "admin_account" }
    first_name_kana { "admin_account" }
    last_name_kana { "admin_account" }
    birthday { Time.current.ago(20.year) }
    sex { 1 }
    contact_number { 11122223333 }
    admin { true }
  end
 end