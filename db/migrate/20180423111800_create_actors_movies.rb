class CreateActorsMovies < ActiveRecord::Migration
  def change
    create_table :actors_movies, id: false do |t|
      t.references :actor, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true
    end
  end
end
