class TopicsController < ApplicationController

  def new
    @topic = Topic.new
  end

  def index
    @topics = Topic.all
  end

  def create
    # Create new topic
    topic = Topic.new(topic_params)
    if topic.save
      redirect_to '/', notice: 'Topic created sucessfully'
    else
      redirect_to '/', notice: 'Failed to create topic'
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:name)
  end
end
