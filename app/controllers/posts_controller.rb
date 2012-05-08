class PostsController < ApplicationController

  before_filter :authenticate, :except => [:index,:show]

  def index
     @posts = Post.all
  end
 
 def new
    @post = Post.new
    respond_to do |format|
       format.html
       format.json { render json: @post }
       format.js 
    end
 end
 
 def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        flash[:error] = "Vous venez de creer le post #{@post.title}"
        format.html { redirect_to posts_path }
        format.json { render json: @post, status: :created, location: @post }
        format.js 
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
      end
    end
 end
 
 def show
    @post = Post.find_by_id(params[:id])
 end
   
 def edit
    @post = Post.find_by_id(params[:id])
    respond_to do |format|
       format.html
       format.json { render json: @post }
       format.js 
    end
 end  
 
 def update
    @post = Post.find(params[:id])
    
    #if @post.update_attributes(params[:post])
     #  redirect_to @post
    #else
     #  render :action => "edit"
    #end
    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:error] = "Vous venez de modifier le post #{@post.title}"
        format.html { redirect_to @post }
        format.json { render json: @post, status: :created, location: @post }
        format.js { redirect_to posts_path }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
      end
    end
 end
 
 def destroy
    @post = Post.find_by_id(params[:id])
    flash[:error] = "Vous venez de supprimer le post #{@post.title}"
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.json { head :no_content }
      format.js
    end
 end
 
end
