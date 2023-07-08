class ReviewsController < ApplicationController
  def index
    # reviews = Review.all
    # render json: reviews, status: :ok
    book = find_book
    reviews = book.reviews
    render json: reviews
  end

  def show
    book = find_book
    review = book.reviews.find(params[:review_id])
    render json: review, status: :ok
  end

  def create
    book = find_book
    review = book.reviews.create!(review_params)
    if review
      render json: review, status: :created
    else
      render json: {error: "Failed to create review!"}, status: :unprocessable_entity
    end
  end

  def update
      book = find_book
      review = book.reviews.find(params[:id])

      if review.update(review_params)
        render json: review, status: :ok
      else
        render json: { error: "Failed to update review" }, status: :unprocessable_entity
      end
  end

  def destroy
    book = find_book
    review = book.reviews.find(params[:id])

    if review.destroy
      render json: { message: "Review deleted successfully" }, status: :ok
    else
      render json: { error: "Failed to delete review" }, status: :unprocessable_entity
    end
  end


  private
  def find_book
      Book.find(params[:book_id])
  end

  def review_params
      params.require(:review).permit(:description, :star_rating, :user_id, :book_id)
  end
end

