class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :comment, presence: true
  validates :rate, presence: true
end
