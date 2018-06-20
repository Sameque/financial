class AddCompetenceToSpent < ActiveRecord::Migration[5.1]
  def change
    add_column :spents, :competence, :date
  end
end
