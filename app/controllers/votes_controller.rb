class VotesController < ApplicationController
  before_action :check_logged_in

  def create
    topic = Topic.find(params[:topic_id])
    vote = Vote.new(user: current_user, topic: topic)
    if vote.save
      redirect_to topics_path, :notice => "Vote successfully recorded"
    else
      redirect_to topics_path, :alert => "Could not create vote"
    end
  end

  def destroy

  end

  private

  def check_logged_in
    unless user_signed_in?
      redirect_to topics_path, :alert => "You must be signed in to votes"
    end
  end

end
