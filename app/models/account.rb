class Account < ApplicationRecord
  belongs_to :user

  enum sex:{ 男性: 0, 女性: 1, その他: 2 }

  validates :first_name, presence: true, length: {in: 1..20 }
  validates :last_name, presence: true, length: {in: 1..20 }
  validates :first_name_kana, presence: true, length: {in: 1..20 }
  validates :last_name_kana, presence: true, length: {in: 1..20 }
  validates :birthday, presence: true
  validates :sex, presence: true
  validates :contact_number, presence: true

  validate :from_full_sixteen_years_old

  def from_full_sixteen_years_old
    unless birthday == nil
      errors.add(:birthday, 'は、満16歳から登録できます') if birthday > Date.current.ago(16.year) 
    end
  end
end
