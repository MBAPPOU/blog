class PostsController < ApplicationController
  def index
     @posts = Post.all
  end
 
 def new
    @post = Post.new
 end
 
 def create
    Post.create(params[:post])
    redirect_to posts_path
 end
 
 def show
    @post = Post.find_by_id(params[:id])
 end
   
 def edit
    @post = Post.find_by_id(params[:id])
 end  
 
 def update
    @post = Post.find_by_id(params[:id])
    @post.update_attributes(params[:post])
    redirect_to post_path(@post)
 end
 
 def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy
    redirect_to posts_path
 end
 
end
