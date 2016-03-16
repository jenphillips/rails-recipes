class RemoveInstructionsFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :instructions
  end
end
