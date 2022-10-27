class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(post_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to user_post_path(@comment.author_id, @comment.post_id)
    else
      @article = Post.find(params[:post_id])
      redirect_to post_path(@article)
    end
  end

  def new
    @comment = Comment.new
  end

  private

  def post_params
    params.require(:comment).permit(:text)
  end
end
