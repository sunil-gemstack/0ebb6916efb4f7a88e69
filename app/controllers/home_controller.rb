class HomeController < ApplicationController
  
	def index
    # Get all questions
		@questions = Question.all
	end
end
