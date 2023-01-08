class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.string :parameterized_name, null: false
      t.string :thumbnail, null: false
      t.string :image, null: false
      t.float :market_price, null: false
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end

    add_index :movies, [:name, :parameterized_name, :owner_id], unique: true
  end
end
