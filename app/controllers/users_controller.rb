class UsersController < ApplicationController
  def index
    users = User.all
    render json: users, status: :ok
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
end
