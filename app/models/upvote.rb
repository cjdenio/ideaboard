class Upvote < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  # Ensure no user can upvote twice
  validates :idea_id, uniqueness: { scope: :user_id }

  validate do |upvote|
    errors.add :idea_id, "can't upvote own idea" if upvote.idea.user_id == upvote.user.id
  end
end
