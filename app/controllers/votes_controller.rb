class VotesController < ApplicationController

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
    check_vote_authorization
    vote = Vote.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    if Vote.destroy(vote)
      redirect_to topics_path, :notice => "You removed your vote!"
    end

  end

  private

  def check_vote_authorization
    unless Topic.find(params[:topic_id]).voting_users.include? current_user
      redirect_to topics_path, :alert => "You aren't authorized to delete this vote"
    end
  end
end
