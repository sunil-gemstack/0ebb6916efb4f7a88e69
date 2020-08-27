class TopicFollower < ApplicationRecord
  # Association
  belongs_to :user
  belongs_to :topic

  validates :topic, uniqueness: { scope: :user, message: "Already following" }
end
