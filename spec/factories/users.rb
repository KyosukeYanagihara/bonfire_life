FactoryBot.define do
  factory :admin, class: User do
    email { "admin@example.com" }
    password { "password" }
    password_confirmation {"password"}
  end

  factory :user1, class: User do
    email { "user1@example.com" }
    password { "password1" }
    password_confirmation {"password1"}
  end

  factory :user2, class: User do
    email { "user2@example.com" }
    password { "password2" }
    password_confirmation {"password2"}
  end
end