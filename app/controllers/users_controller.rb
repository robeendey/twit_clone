class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # See SessionsHelper for sign in function/sessions functions
      sign_in @user
      flash[:success] = "Welcome to Twitta!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
