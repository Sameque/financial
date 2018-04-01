class AddDetailsToSpents < ActiveRecord::Migration[5.1]
  def change
    add_column :spents, :date, :date
  end
end
