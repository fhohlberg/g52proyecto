class RestaurantComment < ApplicationRecord
  belongs_to :restaurante
  has_one_attached :avatar
end
