class AddIngredientsToSteps < ActiveRecord::Migration
  def change
    rename_column :ingredients, :recipe_id, :step_id
  end
end
