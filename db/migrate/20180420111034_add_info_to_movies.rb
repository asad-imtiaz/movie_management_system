class AddInfoToMovies < ActiveRecord::Migration

  def self.up
    change_table :movies do |t|
      t.attachment :poster
      t.datetime :release_date, default: DateTime.now
      t.string :trailer_link
    end
  end

  def self.down
    drop_attached_file :movies, :poster
    remove_column :movies, :release_date
    remove_column :movies, :trailer_link
  end

end
