class CreateProvisions < ActiveRecord::Migration[5.1]
  def change
    create_table :provisions do |t|
      t.references :category, foreign_key: true
      t.decimal :value

      t.timestamps
    end
  end
end
