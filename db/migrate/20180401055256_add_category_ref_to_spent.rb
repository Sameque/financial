class AddCategoryRefToSpent < ActiveRecord::Migration[5.1]
  def change
    add_reference :spents, :category, foreign_key: true
  end
end
