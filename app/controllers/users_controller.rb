require 'pry'

class UsersController < ActionController::Base
  helper_method :current_user
  skip_before_action :verify_authenticity_token

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      flash[:notice] = "You've successfully signed up!"
      session[:user_id] = @user.id
      redirect_to "/user/#{@user.id}"
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to '/signup'
    end
  end

  def show
    binding.pry
    @user = User.find(params[:id])
    @token = @user.call
    render :show
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, :password, :password_confirmation,)
  end
end
