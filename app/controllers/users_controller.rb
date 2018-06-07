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
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thanks for creating an account at Blue Orange <3"
      redirect_to @user
    else
      flash[:danger] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    # Will think about it
  end

  def update
    @user.update_attributes(user_params)
  end

  def destroy
    @user.destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
