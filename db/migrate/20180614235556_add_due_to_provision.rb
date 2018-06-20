class AddDueToProvision < ActiveRecord::Migration[5.1]
  def change
    add_column :provisions, :due, :date
  end
end
