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

  private
  def find_book
    Book.find(params[:book_id])
  end
end
