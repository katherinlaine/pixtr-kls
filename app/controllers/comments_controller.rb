class CommentsController < ApplicationController
  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comment_params)
    if @comment.save
      redirect_to [@image.gallery, @image]
    else
      render "images/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user: :current_user)
  end
end
