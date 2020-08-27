class QuestionsController < ApplicationController
  
  def index
    # Get all questions
    @questions = current_user.questions
  end

  def new
    @question = Question.new
  end

  def create
    # Create question for current logged in user
    question = current_user.questions.new(question_params)
    if question.save
      redirect_to question_path(question), notice: 'Question created sucessfully'
    else
      redirect_to '/', notice: 'Failed to create question'
    end
  end

  def show
    # Get question
    @question = Question.find_by_id(params[:id])
    # Get answers for the question
    @answers = @question.answers
  end

  private

  def question_params
    params.require(:question).permit(:name, :topic_id)
  end
end
