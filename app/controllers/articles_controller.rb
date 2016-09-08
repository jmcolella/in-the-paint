class ArticlesController < ApplicationController


  # before_action :find_article
  # skip_before_action :find_article, only: [:index, :new, :create]

  def index
    @articles = Article.all

    render json: { articles: @articles }
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: { article: @article }
    else
      # Need to change this for telling front end the post failed
      render json: { errors: "Article did not save." }
    end
  end

  def show
    binding.pry
    @comments = @article.comments

    render json: { comments: @comments }
  end

  def edit
  end

  def update
    if @article.update_attributes(article_params)
      render json: { article: @article }
    else
      # Need to change this for telling front end the put failed
      render json: { errors: "Article did not update." }
    end
  end

  def destroy
    @article.destroy

    render json: { success: "200" }
  end

  private

  def find_article
    @article = Article.find_by(params[:id])
  end

  def article_params
    params.require(:articles).permit(:title, :body, :team_id, :user_id)
  end

end
