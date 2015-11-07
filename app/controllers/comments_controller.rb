class CommentsController < ApplicationController
  def create
    review = Review.find(params[:review_id])
    comment = review.comments.create(comment_params)

    redirect_to review_path(comment.review)
  end

  def destroy
    comment = Comment.find(params[:id])
    review = comment.review
    comment.destroy

    redirect_to review_path(review)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
