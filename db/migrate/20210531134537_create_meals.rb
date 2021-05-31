class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.references :chef, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.string :description
      t.decimal :price

      t.timestamps
    end
  end
end
