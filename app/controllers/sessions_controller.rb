class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login user
      redirect_to user
    else
      flash.now[:danger] = "Username or password is incorrect!"
      render 'new'
    end
    # debugger
  end

  def destroy

  end

end
