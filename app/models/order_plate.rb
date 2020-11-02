class OrderPlate < ApplicationRecord

  validates_presence_of  :order, :plate

  belongs_to :order
  belongs_to :plate
  
end
