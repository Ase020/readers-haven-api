class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_author_not_found
  before_action :authorize
  skip_before_action :authorize, only: :index
  def index
    authors = Author.all
    render json: authors, status: :ok
  end

  def show
    author = find_author
    render json: author, serializer: AuthorbookSerializer, status: :ok
  end

  private
  def find_author
    Author.find(params[:id])
  end

  def render_author_not_found
    render json: {error: "Author not found!"}, status: :not_found
  end

  def authorize
    render json: {error: "Not authorized"}, status: :unauthorized unless session.include? :user_id
  end

end
