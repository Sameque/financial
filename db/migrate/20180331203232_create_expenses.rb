class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.string :number
      t.decimal :value
      t.string :description
      t.references :person, foreign_key: true
      t.boolean :paid

      t.timestamps
    end
  end
end
