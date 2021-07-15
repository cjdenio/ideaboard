class IdeasController < ApplicationController
  def index
    ideas_per_page = 10

    @page = params[:p].to_i || 1
    @page = 1 if @page < 1

    @ideas = Idea.select(:id, :body, :user_id, 'COUNT(upvotes.id) AS upvote_count')
                 .joins('LEFT JOIN upvotes ON ideas.id = upvotes.idea_id')
                 .group('ideas.id')
                 .order('upvote_count DESC', 'ideas.created_at DESC')
                 .limit(ideas_per_page + 1)
                 .offset((@page - 1) * ideas_per_page)

    @has_previous = @page != 1
    @has_next = @ideas.length == ideas_per_page + 1

    @ideas = @ideas[0, ideas_per_page]

    @user = User.find(1)
  end

  def index_url
    '/'
  end

  def create
    idea = Idea.new(params.require(:idea).permit(:body).merge(user_id: User.first.id))

    if idea.save
      redirect_to idea
    else
      render plain: 'uh oh'
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end
end
