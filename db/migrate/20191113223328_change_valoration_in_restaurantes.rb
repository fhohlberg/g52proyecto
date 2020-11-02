class ChangeValorationInRestaurantes < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurantes, :valoration1, :integer
  end
end
