class RemovePlatesFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :plates, :text
  end
end
