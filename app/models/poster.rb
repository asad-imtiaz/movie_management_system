class Poster < ActiveRecord::Base

  belongs_to :movie
  has_attached_file :image,
                    styles: { poster: "184x274!", thumb: "100x300" },
                    default_url: ":style/poster_missing.jpg"

end
