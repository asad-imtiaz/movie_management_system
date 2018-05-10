class ForMultiplePostersFunctionality < ActiveRecord::Migration

  def up
    remove_attachment :movies, :poster

    create_table :posters do |t|
      t.attachment :image
      t.references :movie, index: true, foreign_key: true
    end
  end

  def down
    drop_table :posters

    add_attachment :movies, :poster
  end

end
