class UsersController < ApplicationController
  def show
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        # @user.activate!
        login_user!(@user)
        redirect_to root_url
    else
        flash.now[:errors] = @user.errors.full_messages
        render :new
    end
  end

  def activate
    @user = User.find_by(activation_token: params[:activation_token])
    @user.activate!
    login_user!(@user)
    flash[:notice] = 'Successfully activated your account!'
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
