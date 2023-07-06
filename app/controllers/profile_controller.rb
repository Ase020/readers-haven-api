class ProfileController < ApplicationController
    def index
      profiles = Profile.all
      render json: books, status: :ok
    end
  
    def show
      profile = Profile.find(params[:id])
      render json: books, status: :ok
    end
  end