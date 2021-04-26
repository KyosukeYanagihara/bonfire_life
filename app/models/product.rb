class Product < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy

  mount_uploaders :images, ImageUploader 

  validates :name, presence: true
  validates :images, presence: true
  validates :description, presence: true
  validates :size, presence: true
  validates :weight, presence: true, numericality: {only_float: true, greater_than_or_equal_to: 0}
  validates :rental_price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :selling_price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  validate :validate_images


  private
  def validate_images
    num = images.count
    return if  num >= 1 && num <= 5
    errors.add(:images, 'は1ファイル以上5ファイル以下でアップロードしてください')
  end
end
