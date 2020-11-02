class AddRatingsToPlates < ActiveRecord::Migration[5.2]
  def change
    add_column :plates, :ratings, :string, array: true, default: []
  end
end
