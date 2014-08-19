class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :set_topics

  def index
    unless (params[:search_value] == "") || (params[:search_value] == nil)
      @topics = Topic.search_by_topic(params[:search_value])
    end
  end

  def new
    unless user_signed_in?
      redirect_to topics_path, :alert => "You must be signed in to creeate a post."
    end
  end

  def show
  end

  def edit
    check_topic_authorization("You can't edit this topic.")
  end

  def create
    #Create Topic
    @topic = Topic.new(title: params[:title], description: params[:description], creator_id: current_user.id)
    @topic.add_tags_to_topic(params[:tag_selector])

    if @topic.save
      redirect_to topics_path, :notice => "New topic saved"
    else
      flash[:alert] = "Topic not saved!"
      render :new
    end
  end

  def update
    check_topic_authorization("You can't update this topic!")
    @topic.title = params[:title]
    @topic.description = params[:description]
    @topic.add_tags_to_topic(params[:tag_selector])
    @topic.save!
    redirect_to topic_path(@topic), :notice => "Topic updated"
  end

  def destroy
    check_topic_authorization("You can't destroy this topic!")
    if Topic.destroy(@topic)
      redirect_to topics_path, :notice => "You deleted a topic"
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_topics
    @topics = Topic.all
  end


  def check_topic_authorization(message="This action isn't allowed")
    unless user_signed_in? && (@topic.creator == current_user)
      redirect_to topic_path(@topic), :alert => message
    end
  end
end
