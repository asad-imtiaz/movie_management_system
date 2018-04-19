class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum gender: [:male, :female]

  def set_picture_respect_to_gender
     self.male? ? ":style/male_missing.png" : ":style/female_missing.png"
  end

  has_attached_file :profile_pic,
                      styles: { medium: "300>", thumb: "50x50#" },
                      default_url: :set_picture_respect_to_gender

end
