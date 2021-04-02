class Product < ApplicationRecord
  has_many :photos
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  accepts_nested_attributes_for :photos
end
