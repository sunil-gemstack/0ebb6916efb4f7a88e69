class AnswersController < ApplicationController
  before_action :find_question

  def create
    # Create answer for question
    answer = @question.answers.new(answers_params.merge(user_id: current_user.id))
    if answer.save
      redirect_to question_path(@question), notice: 'Answer created sucessfully'
    else
      redirect_to question_path(@question), notice: 'Failed to create answer'
    end
  end

  private

  def find_question
    # Find question
    @question = Question.find_by(id: params[:question_id])
  end
  
  def answers_params
    params.require(:answer).permit(:name)
  end
end
