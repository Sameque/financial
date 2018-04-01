class CreateSpents < ActiveRecord::Migration[5.1]
  def change
    create_table :spents do |t|
      t.string :number
      t.decimal :value
      t.string :description
      t.boolean :closed
      t.references :person, foreign_key: true
      t.references :payment, foreign_key: true
      t.references :expense, foreign_key: true, :null => true

      t.timestamps
    end
  end
end
