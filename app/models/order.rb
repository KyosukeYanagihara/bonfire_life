class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  enum status:{ 仮予約: 0, 発送待ち: 1, 発送中: 2, 返却中: 3, 完了: 4 }

  validates :rental_start, presence: true
end
