class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true
      t.string :content
      t.boolean :flagged, default: false

      t.timestamps null: false
    end
  end
end
