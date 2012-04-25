class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def authenticate
     unless session[:connected_user]
        redirect_to "http://localhost:4567/blog/authenticate?backup_url=http://localhost:3000/login"
     end
  end
  
  def login
     if params[:secret] = 1234
        session[:connected_user] = params[:user]
     else
        flash[:error] = "Authentification failed"
        render "authenticate"
     end
  end
end
