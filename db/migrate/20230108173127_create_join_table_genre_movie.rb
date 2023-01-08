class CreateJoinTableGenreMovie < ActiveRecord::Migration[7.0]
  def change
    create_join_table :genres, :movies do |t|
      t.index [:genre_id, :movie_id]
    end
  end
end
