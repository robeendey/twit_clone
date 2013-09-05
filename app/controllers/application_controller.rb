class ApplicationController < ActionController::Base
  protect_from_forgery
  # Added this line below so that the module is available in controllers
  include SessionsHelper

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end
end
