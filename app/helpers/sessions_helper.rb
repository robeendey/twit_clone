module SessionsHelper
# This file has been included in the Application Controller so that 
# the code is available in Controllers, in addition the the views (default)
  def sign_in(user)
    # Store a cookie (permanent sets it to exp. 20 yrs from now) on browser
    # set equal to the user's remember token, which was originally created 
    # and saved in db when user was created. Note, the remember token also 
    # udpates every time the user is saved (i.e. updated)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  # Require users to be signed in
    def signed_in_user
      unless signed_in?
        store_location # for friendly forwarding
        redirect_to signin_url, notice: "Please sign in."
      end
    end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  # A setter method
  def current_user=(user)
    @current_user = user
  end

  # Getter method
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  # A boolean check
  def current_user?(user)
    user == current_user
  end

  # For friendly forwarding...
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
end
