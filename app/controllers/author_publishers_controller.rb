class AuthorPublishersController < ApplicationController
  def index
    author_publishers = AuthorPublisher.all
    render json: author_publishers, status: :ok
  end
end
