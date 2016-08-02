class CommentsController < ApplicationController

  before_action :find_comment

  def new
  end

  def create
    @comment = Comment.new(article_params)

    if @comment.save
      status 200
    else
      # Need to change this for telling front end the post failed
      render 'new'
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes(comment_params)
      status 200
    else
      # Need to change this for telling front end the put failed
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def find_comment
    @comment = Comment.find_by(params[:id])
  end

  def comment_params
    params.require(:comments).permit(:body, :article_id, :user_id)
  end

end
