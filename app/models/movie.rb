class Movie < ActiveRecord::Base

  has_and_belongs_to_many :actors
  validates :title, presence: true

  has_attached_file :poster,
                      styles: { poster: "200x420>", thumb: "100x300" },
                      default_url: ":style/poster_missing.jpg"

end
