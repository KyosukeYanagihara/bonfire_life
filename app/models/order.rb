class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  enum status:{ 仮予約: 0, 発送待ち: 1, 発送中: 2, 返却中: 3, 完了: 4 }
  enum rental_period: { "2泊3日": 0, "3泊4日": 1, "4泊5日": 2, "5泊6日": 3, "6泊7日": 4 }
  enum insurance_fee:{ 保険なし: 0, 用品保険1000: 1, 用品保険2000: 2, 用品保険3000: 3 }

  validates :rental_start, presence: true
  validates :rental_period, presence: true
  validates :insurance_fee, presence: true

  def rental_period_to_quantify(rental_period)
    if rental_period == "2泊3日"
      0
    elsif rental_period == "3泊4日"
      1000
    elsif rental_period == "4泊5日"
      2000
    elsif rental_period == "5泊6日"
      3000
    elsif rental_period == "6泊7日"
      4000
    end
  end

  def insurance_fee_to_quantify(insurance_fee)
    if insurance_fee == "保険なし"
      0
    elsif insurance_fee == "用品保険1000"
      1000
    elsif insurance_fee == "用品保険2000"
      2000
    elsif insurance_fee == "用品保険3000"
      3000
    end
  end
end
