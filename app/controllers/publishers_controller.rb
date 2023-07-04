class PublishersController < ApplicationController
  def index
    publishers = Publisher.all
    render json: publishers, status: :ok
  end
end
