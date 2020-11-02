class CreatePlateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :plate_comments do |t|
      t.text :body

      t.timestamps
    end
  end
end
