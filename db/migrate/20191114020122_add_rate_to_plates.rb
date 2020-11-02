class AddRateToPlates < ActiveRecord::Migration[5.2]
  def change
    add_column :plates, :rate, :string
  end
end
