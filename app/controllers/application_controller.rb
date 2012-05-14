class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def authenticate
     if params[:secret] == "1234" && params[:user]
        flash[:error] = "Bienvenue #{params[:user]}"
        session[:connected_user] = params[:user]
        redirect_to posts_path
     else
        redirect_to login_path
     end
  end
  
  def login
     if session[:connected_user] == nil
        redirect_to "http://localhost:4567/blog/authenticate?backup_url=#{authenticate_url}"
     else
        flash[:error] = "Vous etes deja logue"
     end
  end
  
  def disconnect
     session[:connected_user] = nil
     render :inline => "Vous etes deconnecte link_to 'Se loguer', login_path"
  end
end
