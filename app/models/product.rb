class Product < ApplicationRecord
  has_many :photos
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  accepts_nested_attributes_for :photos
end
