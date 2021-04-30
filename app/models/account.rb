class Account < ApplicationRecord
  belongs_to :user

  enum sex:{ 男性: 0, 女性: 1, その他: 2 }

  VALID_PASSWORD_REGEX = /\A[ァ-ヶー－]+\z/

  validates :first_name, presence: true, length: {in: 1..20 }
  validates :last_name, presence: true, length: {in: 1..20 }
  validates :first_name_kana, presence: true, length: {in: 1..20 }, 
                              format: { with: VALID_PASSWORD_REGEX,
                              message: "は全角カタカナで入力してください"}
  validates :last_name_kana, presence: true, length: {in: 1..20 },
                             format: { with: VALID_PASSWORD_REGEX,
                             message: "は全角カタカナで入力してください"}
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
