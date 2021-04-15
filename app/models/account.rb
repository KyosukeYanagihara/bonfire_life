class Account < ApplicationRecord
  belongs_to :user

  enum sex:{ 男性: 0, 女性: 1, その他: 2 }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birthday, presence: true
  validates :sex, presence: true
  validates :contact_number, presence: true
end
