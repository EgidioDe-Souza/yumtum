class AddChefToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :chef, :boolean
  end
end
