class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    #debugger
  end

  def new
    @user = User.new
    # debugger
  end

  def create
    # Some Long shit
  end

  def edit
    # Will think about it
  end

  def update
    @user.update_attributes(user_params)
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
