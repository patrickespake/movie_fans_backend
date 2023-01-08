class CreateGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :genres do |t|
      t.string :name, null: false, unique: true
      t.string :parameterized_name, null: false, unique: true

      t.timestamps
    end
  end
end
