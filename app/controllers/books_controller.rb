class BooksController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_book_not_found
  # before_action :authorize
  # skip_before_action :authorize, only: [:index]
  def index
    books = Book.all
    render json: books, status: :ok
  end

  def show
    book = Book.find(params[:id])
    render json: book, serializer: BookReviewsPublisherSerializer, status: :ok
  end

  private
  def authorize
    render json: { error: "Unauthorized"}, status: :unauthorized unless session.include? :user_id
  end
  def render_book_not_found
    render json: {error: "Book not found"}, status: :not_found
  end
end
