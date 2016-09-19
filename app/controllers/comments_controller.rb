class CommentsController < ApplicationController

  before_action :find_comment

  def new
  end

  def create
    @comment = Comment.new(comment_params)

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
    if @comment.update_attributes(comment_params)
      render json: { updated_comment: @comment }
    else
      # Need to change this for telling front end the put failed
      render json: { error: "Comment did not update." }
    end
  end

  def destroy
    @comment.destroy

    @article = Article.find_by(id: params[:article_id])

    render json: { comments: @article.comments }
  end

  private

  def find_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comments).permit(:body, :article_id, :user_id)
  end

end
