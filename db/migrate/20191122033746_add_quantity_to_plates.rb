class AddQuantityToPlates < ActiveRecord::Migration[5.2]
  def change
    add_column :plates, :quantity, :integer
  end
end
