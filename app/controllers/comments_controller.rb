class CommentsController < ApplicationController
  before_action :check_comment_authorization, :only => [:update, :destroy]
  before_action :set_topic
  before_action :set_comment, :only => [:update, :destroy]

  def create
    @comment = Comment.new(comment_text: params[:comment_text], user_id: current_user.id, topic_id: @topic.id)
    if @comment.save
      redirect_to topic_path(@topic), :notice => "You created a comment"
    else
      redirect_to topic_path(@topic), :alert => "Your comment could not be created!"
    end

  end

  # TODO Currently unused and untested
  def update
    @comment.comment_text = params[:comment_text]
    if @comment.save
      redirect_to topic_path(@topic), :notice => "You created a comment"
    else
      redirect_to topic_path(@topic), :alert => "Your comment could not be created!"
    end
  end

  #TODO Currently unused and untested
  def destroy
    if Comment.destroy(@comment)
      redirect_to topic_path(@topic), :notice => "You deleted your comment!"
    else
      redirect_to topic_path(@topic), :alert => "Your comment could not be deleted!"
    end
  end

  private

  def check_comment_authorization
    #TODO write this at some point
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

end