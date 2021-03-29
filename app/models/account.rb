class Account < ApplicationRecord
  belongs_to :user

  enum sex:{ 男性: 0, 女性: 1, その他: 2 }
end
