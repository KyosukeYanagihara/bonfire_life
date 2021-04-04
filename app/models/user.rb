class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address
  has_one :account
  has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :account
end
