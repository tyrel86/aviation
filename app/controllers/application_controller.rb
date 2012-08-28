class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def authorize
    redirect_to "/login", alert: "Not authorized" unless session[:login]
  end
end
