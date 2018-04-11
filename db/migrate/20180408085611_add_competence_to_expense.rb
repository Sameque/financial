class AddCompetenceToExpense < ActiveRecord::Migration[5.1]
  def change
    add_column :expenses, :competence, :date
  end
end
