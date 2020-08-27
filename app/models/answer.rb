class Answer < ApplicationRecord
  # Association
	belongs_to :user
	belongs_to :question

	validates_presence_of :name
end
