class AddPlateIdToPlateComment < ActiveRecord::Migration[5.2]
  def change
    add_column :plate_comments, :plate_id, :integer
  end
end
