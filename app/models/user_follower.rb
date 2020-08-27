class UserFollower < ApplicationRecord
  # Association
  belongs_to :user
  belongs_to :follower, class_name: 'User'

  validates :user, uniqueness: { scope: :follower, message: "Already following" }
end
