class PublishersController < ApplicationController
  def index
    publishers = Publisher.all
    render json: publishers, status: :ok
  end

  def show
    publisher = Publisher.find(params[:id])
    render json: publisher, status: :ok
  end
end
