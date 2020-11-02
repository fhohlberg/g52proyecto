# frozen_string_literal: true

class CreatePlates < ActiveRecord::Migration[5.2]
  def change
    create_table :plates do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.integer :portions
      t.string :image

      t.timestamps
    end
  end
end
