class ArticlesController < ApplicationController


  before_action :find_article
  skip_before_action :find_article, only [:new, :create]

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      status 200
    else
      # Need to change this for telling front end the post failed
      render 'new'
    end
  end

  def show
    @comments = @article.comments
  end

  def edit
  end

  def update
    if @article.update_attributes(article_params)
      status 200
    else
      # Need to change this for telling front end the put failed
      render 'edit'
    end
  end

  def destroy
    @article.destroy
  end

  private

  def find_article
    @article = Article.find_by(params[:id])
  end

  def article_params
    params.require(:articles).permit(:title, :body, :team_id, :user_id)
  end

end
