class BooksController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_book_not_found
  # before_action :authorize
  # skip_before_action :authorize, only: [:index]

  def index
    books = Book.all.order(created_at: :desc)
    render json: books, status: :ok
  end

  def show
    book = find_book
    render json: book, serializer: BookReviewsPublisherSerializer, status: :ok
  end

  def create
    book = Book.create!(book_params)
    if book.valid?
      render json: book, status: :created
      session[:user_id] = book.user_id
    else
      render json: {error: "Book not saved!"}, status: :unprocessable_entity
    end
  end

  def destroy
    book = find_book

    if book.destroy
      render json: { message: "Book deleted successfully" }, status: :ok
    else
      render json: { error: "Failed to delete book" }, status: :unprocessable_entity
    end

  end

  private
  def find_book
    Book.find(params[:id])
  end

  def authorize
    render json: { error: "Unauthorized"}, status: :unauthorized unless session.include? :user_id
  end
  def render_book_not_found
    render json: {error: "Book not found"}, status: :not_found
  end

  def book_params
    params.permit(:title, :genre, :description, :publish_date, :price, :user_id, :author_id, :publisher_id, :poster_url)
  end
end
