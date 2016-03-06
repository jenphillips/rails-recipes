class AddAmountToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :amount, :float
    add_column :ingredients, :unit, :string
  end
end
