class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    bounce_guest
    if params[:album_index].to_i + 1 > session[:albums_arr].length
      flash[:error] = "Please check the index number."
      redirect_to search_1_path
    end
    @review = Review.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    if @review.save
      redirect_to reviews_path
    else
      flash[:error] = @review.errors.full_messages
      render 'new'
    end
  end

  def show
    @review = Review.find(params[:id])
    @comments = @review.comments.order('created_at')
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)

    if @review.valid?
      redirect_to @review
    else
      flash[:error] = @review.errors.full_messages
      render "edit"
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.comments.destroy_all
    review.destroy

    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :album_name, :artist_name, :album_release_date)
  end

end