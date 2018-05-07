class AddUsedToProvision < ActiveRecord::Migration[5.1]
  def change
    add_column :provisions, :used, :decimal, default:0
  end
end
