# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email: "rctttzg7@sample.com",
  password: '123456789',
  password_confirmation: '123456789',
  created_at: Time.current,
  updated_at: Time.current,
  id: 1
)

Address.create!(
  postcode: 345-9617,
  prefecture_code: 24,
  city: "四日市市",
  address1: "6-5",
  user_id: 1,
  created_at: Time.current,
  updated_at: Time.current
)

Account.create!(
  admin: true,
  first_name: "太郎",
  last_name: "山田",
  first_name_kana: "タロウ",
  last_name_kana: "ヤマダ",
  birthday: Time.current,
  sex: 1,
  contact_number: 12345678901,
  user_id: 1,
  created_at: Time.current,
  updated_at: Time.current
)

