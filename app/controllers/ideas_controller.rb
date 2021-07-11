class IdeasController < ApplicationController
  def index
    @idea = Idea.new
    @ideas = Idea.all
  end

  def index_url
    '/'
  end

  def create
    idea = Idea.new(params.require(:idea).permit(:body))
    idea.save

    redirect_to :index
  end

  def show
    @idea = Idea.find(params[:id])
  end
end
