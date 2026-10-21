class CommentsController < ApplicationController
  before_action :set_comment

  def create
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :body)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
