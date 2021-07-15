class Idea < ApplicationRecord
  belongs_to :user

  has_many :upvotes

  def user_upvoted(user_id)
    upvote = Upvote.find_by(idea_id: id, user_id: user_id)

    upvote.nil? ? false : true
  end
end
