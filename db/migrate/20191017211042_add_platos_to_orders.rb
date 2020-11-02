class AddPlatosToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :platos, :string, array: true, default: []
  end
end
