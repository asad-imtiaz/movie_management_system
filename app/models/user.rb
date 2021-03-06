class User < ActiveRecord::Base

  has_and_belongs_to_many :favorites, class_name: "Movie", association_foreign_key: 'movie_id'
  has_many :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum gender: [:male, :female]
  validates :first_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  has_attached_file :profile_pic,
                      styles: { medium: "300x300#", thumb: "50x50#" },
                      default_url: :default_picture_wrt_gender

  def default_picture_wrt_gender
     self.male? ? ":style/male_missing.png" : ":style/female_missing.png"
  end

  def full_name
    return [first_name.capitalize, last_name.capitalize].join(' ')
  end

end
