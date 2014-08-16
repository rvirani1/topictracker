class TopicsController < ApplicationController
  before_action :set_topics

  def index
  end

  def new
    unless user_signed_in?
      redirect_to topics_path, :alert => "You must be signed in to creeate a post."
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
    @topic = Topic.find(params[:id])
    unless user_signed_in? && (@topic.user == current_user)
      redirect_to topic_path(@topic), :alert => "You can't edit this topic."
    end
  end

  def create
    @topic = Topic.new(title: params[:title], description: params[:description], user_id: current_user.id)
    if @topic.save
      redirect_to topics_path, :notice => "New topic saved"
    else
      flash[:alert] = "Topic not saved!"
      render :new
    end
  end

  private

  def set_topics
    @topics = Topic.all
  end
end
