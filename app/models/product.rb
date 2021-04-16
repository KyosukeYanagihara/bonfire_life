class Product < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true
  validates :size, presence: true
  validates :weight, presence: true
  validates :rental_price, presence: true
  validates :selling_price, presence: true
end
