class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :movie

  validates :content, presence: true

  def owner?(user)
    return false unless user
    return self.user_id == user.id
  end

end
