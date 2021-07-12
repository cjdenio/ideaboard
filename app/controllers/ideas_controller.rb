class IdeasController < ApplicationController
  def index
    ideas_per_page = 10

    @page = params[:p].to_i || 1
    @page = 1 if @page < 1

    @ideas = Idea.limit(ideas_per_page + 1).offset((@page - 1) * ideas_per_page)

    @has_previous = @page != 1
    @has_next = @ideas.length == ideas_per_page + 1

    @ideas = @ideas[0, ideas_per_page]
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
