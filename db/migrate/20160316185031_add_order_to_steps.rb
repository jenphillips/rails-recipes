class AddOrderToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :order, :integer
  end
end
