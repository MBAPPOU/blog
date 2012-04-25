class PostsController < ApplicationController

  before_filter :authenticate, :except => [:index,:show]

  def index
     @posts = Post.all
  end
 
 def new
    @post = Post.new
 end
 
 def create
    @post = Post.create(params[:post])
    flash[:error] = "Vous venez de creer le post #{@post.title}"
    redirect_to posts_path
 end
 
 def show
    @post = Post.find_by_id(params[:id])
 end
   
 def edit
    @post = Post.find_by_id(params[:id])
 end  
 
 def update
    @post = Post.find(params[:id])
    flash[:error] = "Vous venez de modifier le post #{@post.title}"
    if @post.update_attributes(params[:post])
       redirect_to @post
    else
       render :action => "edit"
    end
 end
 
 def destroy
    @post = Post.find_by_id(params[:id])
    flash[:error] = "Vous venez de supprimer le post #{@post.title}"
    @post.destroy
    redirect_to posts_path
 end
 
end
