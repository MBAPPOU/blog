class PostsController < ApplicationController
  def index
     @posts = Post.all
  end
  
  def new
     @post = Post.new
  end
  
  def create
     p = Post.create(params[:post])
     redirect_to posts_path
  end
  
  def edit
     @post = Post.find_by_id(params[:id])
  end
  
  def update
     @post = Post.find_by_id(params[:id])
     @post.update(params[:post)
     redirect_to posts_path
  end
  
  
  
  
end
