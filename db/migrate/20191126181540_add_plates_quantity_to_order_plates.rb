class AddPlatesQuantityToOrderPlates < ActiveRecord::Migration[5.2]
  def change
    add_column :order_plates, :plates_quantity, :integer
  end
end
