class SessionsController < ApplicationController
  # before_action :authorize
  # skip_before_action :authorize, only: [:create, :destroy, :show]
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: {error: "Invalid username or password"}, status: :unauthorized
    end
  end

  def show
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    head :no_content
  end

  # def authorize
  #   render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  # end
end