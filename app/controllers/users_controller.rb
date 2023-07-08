class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_user_not_found
  # before_action :authorize
  # skip_before_action :authorize, only: [:show, :create, :reset,]
  def index
    users = User.all
    render json: users, status: :ok
  end

  def user
    user = find_user
    render json: user, status: :ok
  end
  def create
    user = User.create!(user_params)
    if user.valid?
      render json: user, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: session[:user_id])
    if user
      session[:user_id] = user.id
      render json: user
    else
      render json: {error: "Not Authorized"}, status: :unauthorized
    end
  end

  def reset
    user = User.find_by(email: params[:email])
    if user
      if params[:new_password] == params[:confirm_password]
        hash_password = BCrypt::Password.create(params[:new_password])
        user.update(password_digest: hash_password)
        render json: {message: "Password reset successfully!"}, status: :ok
      else
        render json: {message: "Error! New password and confirm password do not match."}, status: :unprocessable_entity
      end
    else
      render json: {error: "User not found!"}, status: :not_found
    end
  end

  private
  def user_params
    params.permit(:first_name, :last_name, :email, :image_url, :password, :password_confirmation)
  end

  def find_user
    User.find(params[:id])
  end

  # def authorize
  #   render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  # end

  def render_user_not_found
    render json: {error: "User not found!"}, status: :not_found
  end
end
