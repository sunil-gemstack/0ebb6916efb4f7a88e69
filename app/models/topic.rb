class Topic < ApplicationRecord
	# Association
  has_many :topic_followers
  has_many :users, through: :topic_followers
	has_many :questions, dependent: :destroy

	validates_presence_of :name
  validates_uniqueness_of :name
end
