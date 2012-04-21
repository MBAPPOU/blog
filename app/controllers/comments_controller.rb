class CommentsController < ApplicationController

   def new
      @comment = Comment.new
   end
   
   def create
      @post = Post.find_by_id(params[:post_id])
      Comment.create(params[:comment],@post)
      redirect_to post_path(params[:post_id])
   end
   
   def destroy
      @comment = Comment.find_by_id(params[:id])
      @comment.destroy
      redirect_to post_path(params[:post_id])
   end
end
