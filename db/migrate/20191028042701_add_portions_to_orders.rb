class AddPortionsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :portions, :integer
  end
end
