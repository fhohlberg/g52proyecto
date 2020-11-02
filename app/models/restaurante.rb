# frozen_string_literal: true
#
class Restaurante < ApplicationRecord
  validates :name, :adress, :mail, :phone_number, presence: true
  belongs_to :client
  has_many :plates, dependent: :destroy
  has_many :restaurant_comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one_attached :avatar
  has_many :admins

  def mas_ordenados
    self.plates.most_purchased
  end


end
