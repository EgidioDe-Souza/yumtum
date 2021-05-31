class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key: { to_table: :users }
      t.integer :quantity

      t.timestamps
    end
  end
end
