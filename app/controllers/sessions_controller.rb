class SessionsController < ApplicationController
  def new
    redirect_to "/admin/index" unless session[:login].nil?
  end

  def create
    if( params[:password] == "WrNs95PE" and params[:user_name] == "admin" )
     session[:login] = ")7t9+v4-IN!~eFOcxEnIFK38wz0M$|}`_y9g|Wd_n&j,:B39Zss8!QaCFLXQmie" 
     redirect_to "/admin/index"
    else
      flash[:notice] = "Incorect login NSA has been notified be afraid"
      render :new
    end
  end
end
