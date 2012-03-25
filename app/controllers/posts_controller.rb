class PostsController < ApplicationController
  def index
     @posts = Post.all
  end
 
 def new
    @post = Post.new
 end
 
 def create
    Post.create(params[:post])
    redirect posts_path
 end
 
 def show
    @post = Post.find_by_id(params[:id])
 end
   
end
