class UpvotesController < ApplicationController
  def upvote
    upvote = Upvote.new idea_id: params[:idea_id], user_id: 1

    unless upvote.save
      upvote = Upvote.find_by(idea_id: params[:idea_id], user_id: 1)

      upvote.destroy unless upvote.nil?
    end

    render plain: 'OK'
  end
end
