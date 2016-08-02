class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      flash[:success] = "Successfully created account!"
      redirect_to "/"
    else
      flash[:danger] = "Invalid email or password."
      redirect_to "/signup"
    end
  end

end
