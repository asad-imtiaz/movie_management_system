class CreateUsersFavorites < ActiveRecord::Migration
  def change
    create_table :movies_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true
    end
  end
end
