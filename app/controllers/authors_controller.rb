class AuthorsController < ApplicationController
  def index
    authors = Author.all
    render json: authors, status: :ok
  end
end
