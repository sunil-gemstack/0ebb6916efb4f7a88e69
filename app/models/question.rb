class Question < ApplicationRecord
  # Association
	belongs_to :user
	belongs_to :topic
	has_many :answers, dependent: :destroy

	validates_presence_of :name
end
