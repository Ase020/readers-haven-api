class ReviewsController < ApplicationController
  def index
    reviews = Review.all
    render json: reviews, status: :ok
  end
  
end
