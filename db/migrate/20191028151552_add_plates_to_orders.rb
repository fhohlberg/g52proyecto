class AddPlatesToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :hash_platos, :json, null: false, default: '{}'
  end
end
