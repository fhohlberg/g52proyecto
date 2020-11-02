class AddClientToPlateComment < ActiveRecord::Migration[5.2]
  def change
    add_column :plate_comments, :client_id, :integer
    add_column :plate_comments, :client_name, :string
  end
end
