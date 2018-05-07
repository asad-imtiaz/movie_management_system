class Actor < ActiveRecord::Base

  has_and_belongs_to_many :movies
  has_attached_file :headshot,
                      styles: { medium: "300x300#", thumb: "50x50#" },
                      default_url: ":style/missing_headshot.jpg"

  validates :name, presence: true


end
