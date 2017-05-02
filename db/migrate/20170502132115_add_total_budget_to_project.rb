class AddTotalBudgetToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :total_budget, :string
  end
end
