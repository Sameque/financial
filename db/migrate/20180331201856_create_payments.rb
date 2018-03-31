class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :name
      t.boolean :money
      t.boolean :card

      t.timestamps
    end
  end
end
