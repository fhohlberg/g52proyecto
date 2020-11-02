# frozen_string_literal: true
#
class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, :lastname, :address, presence: true
  has_many :restaurantes, dependent: :destroy
  has_many :orders
  has_one_attached :avatar
end
