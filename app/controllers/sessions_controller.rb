class SessionsController < ApplicationController
  # Sessions functions are in SessionsHelper
  
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect, see SessionsHelper for definition
      sign_in user
      redirect_to user
    else
      # Use flash.now since render doesn't count as a separate request
      # hence just using flash would persist to one more page request
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out  
    redirect_to root_url
  end
end
