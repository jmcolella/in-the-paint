class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end


  def show
    @article = Article.find_by(params[:id])
    @comments = @article.comments
  end

end
