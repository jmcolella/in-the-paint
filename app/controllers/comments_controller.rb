class CommentsController < ApplicationController

  # before_action :find_comment

  def new
  end

  def create
    @comment = Comment.new(body: params[:comments][:body], article_id: params[:comments][:article_id], user_id: params[:comments][:user_id])

    if @comment.save
      render json: { comment: @comment }
    else
      # Need to change this for telling front end the post failed
      render json: { error: "Comment did not save." }
    end
  end

  def edit
  end

  def update
    # binding.pry
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(body: params[:comments][:body], article_id: params[:comments][:article_id], user_id: params[:comments][:user_id])
      render json: { comment: @comment }
    else
      # Need to change this for telling front end the put failed
      render json: { error: "Comment did not update." }
    end
  end

  def destroy
    # binding.pry
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy

    @article = Article.find_by(id: params[:article_id])

    render json: { comments: @article.comments }
  end

  private

  def find_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comments).permit(params[:comments][:body], params[:comments][:article_id], params[:comments][:user_id])
  end

end
