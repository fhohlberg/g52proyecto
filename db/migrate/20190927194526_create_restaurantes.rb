# frozen_string_literal: true

class CreateRestaurantes < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurantes do |t|
      t.string :name
      t.string :mail
      t.string :adress
      t.string :valoration
      t.string :phone_number

      t.timestamps
    end
  end
end
