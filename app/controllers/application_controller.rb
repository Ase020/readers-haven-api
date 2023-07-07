class ApplicationController < ActionController::API
  include ActionController::Cookies

  # before_action :authorize

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authorize
    render json: { message: 'Unauthorized!' }, status: :unauthorized unless current_user
  end
end
