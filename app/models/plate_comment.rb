class PlateComment < ApplicationRecord
  belongs_to :plate
  has_one_attached :avatar
end
