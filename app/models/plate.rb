# frozen_string_literal: true
#
class Plate < ApplicationRecord
  validates :name, :price, :description, :avatar, presence: true
  has_one_attached :avatar
  belongs_to :restaurante
  has_many :plate_comments
  has_many :admins, through: :restaurante
  has_many :order_plates
  has_many :orders, through: :order_plates

  def self.most_purchased
    self.group("plates.id'")
    self.order("plates.quantity desc").limit(10)
    self.pluck("plates.name, plates.quantity")
  end

end
