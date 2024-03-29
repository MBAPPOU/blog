class CommentsController < ApplicationController

   before_filter :login
   
   def new
      @comment = Comment.new 
      @comment.post = Post.find(params[:post_id])
   end
   
   def create
      @post = Post.find_by_id(params[:post_id])
      @comment = @post.comments.create(params[:comment])
      flash[:error] = "Vous venez de creer un commentaire sur le post #{@post.title}"
      redirect_to post_path(@post)
   end
   
   def destroy
      @post = Post.find(params[:id])
      @comment = @post.comments.find(params[:post_id])
      flash[:error] = "Vous venez de supprimer un commentaire sur le post #{@post.title}"
      @comment.destroy
      redirect_to (@post)
   end
end
