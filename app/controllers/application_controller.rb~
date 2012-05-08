class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def authenticate
     if ! session[:connected_user]
        redirect_to "http://localhost:4567/blog/authenticate?backup_url=http://localhost:3000/login"
     else
        flash[:error] = "Authentification succeed"
        #redirect_to :back
     end
  end
  
  def login
     if params[:secret] = 1234
        session[:connected_user] = params[:user]
        redirect_to posts_path
     else
        flash[:error] = "Authentification failed"
        render "authenticate"
     end
  end
  
  def disconnect
     session[:connected_user] = nil
  end
end
