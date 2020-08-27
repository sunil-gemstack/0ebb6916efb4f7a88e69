class FollowerController < ApplicationController
  before_action :find_question
  before_action :find_user, only: [:follow_user]

  def follow_user
    unless is_self_user?
      user = @question.user
      follower = @user.user_followers.create(follower_id: current_user.id)
      notice = follower.errors.present? ? follower.errors.full_messages.join(', ') : 'Followed sucessfully'
    else
      notice = 'Sorry! You cant follow youself'
    end
    redirect_to '/', notice: notice
  end

  def follow_topic
    follower = current_user.topic_followers.create(topic_id: @question.topic_id)
    redirect_to '/', notice: follower.errors.present? ? follower.errors.full_messages.join(', ') : 'Topic followed sucessfully'
  end

  private

  def find_user
    @user = @question.user
  end
  
  def find_question
    @question = Question.find(params[:id])
  end

  def is_self_user?
    current_user.id == @user.id
  end
end
