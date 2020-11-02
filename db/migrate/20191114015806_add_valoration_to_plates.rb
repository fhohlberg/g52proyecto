class AddValorationToPlates < ActiveRecord::Migration[5.2]
  def change
    add_column :plates, :valoration, :integer
  end
end
