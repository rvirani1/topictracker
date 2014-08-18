class TagsController < ApplicationController
  before_action :check_topic_authorization, :except => [:show]

  def show
    @tag = Tag.find(params[:id])
    @topics = @tag.topics
    render 'topics/index'
  end

  def create

  end

  def destroy

  end

  private

  def check_topic_authorization
    unless Topic.find(params[:topic_id]).creator == current_user
      redirect_to topics_path, :alert => "You aren't authorized to update this topic"
    end
  end
end
