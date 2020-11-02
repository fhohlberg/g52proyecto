class Order < ApplicationRecord
  validates :payment, :address, presence: true
  belongs_to :restaurante
  belongs_to :client
  has_many :order_plates
  has_many :plates, through: :order_plates
  has_many :admins, through: :restaurante
end
