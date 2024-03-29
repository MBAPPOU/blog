require 'spec_helper'

describe CommentsController do
   describe "GET 'new'" do
    before(:each) do
      @post = stub_model(Post,:title => "1",:body => " Hi")
      @comment = stub_model(Comment,:author => "me",:body => " Hello",:post => @post)
      Post.stub(:find){ @post }
      Comment.stub(:new){ @comment }
      @comment.stub(:post=)
    end
    it "assigns a comment" do
      Comment.should_receive(:new).and_return(@comment)
      get 'new'
      assigns(:comment).should eq @comment
    end

    it "renders a formular to create a commment" do
      get 'new'
      response.should render_template(:new)
    end
  end
  
  describe "POST 'create'" do
    before(:each) do
      @post = stub_model(Post,:title => "1",:body => " Hi")
      @comment = stub_model(Comment,:author => "me",:body => " Hello",:post => @post)
      Post.stub(:find_by_id){ @post }
      @tabcomment = []
      @post.stub(:comments){ @tabcomment }
      @tabcomment.stub(:create){ @comment }
    end
    it "assigns a comment" do
      @post.comments.should_receive(:create).and_return(@comment)
      post 'create'
      assigns(:comment).should eq @comment
    end

    it "should redirect to the commented post" do
      post 'create'
      response.should redirect_to (@post)
    end
  end
  
  describe "GET 'destroy'" do
    before(:each) do
      @post = stub_model(Post,:title => "1",:body => " Hi")
      @comment = stub_model(Comment,:author => "me",:body => " Hello")
      @tabcomment = []
      Post.stub(:find){ @post }
      @post.stub(:comments){ @tabcomment }
      @tabcomment.stub(:find){ @comment }
      Comment.stub(:new){ @comment }
      @comment.stub(:post=)
      @comment.stub(:destroy)
    end
    it "destroys a comment" do
      @comment.should_receive(:destroy)
      get 'destroy'
      assigns(:comment).should eq @comment
      response.should be_redirect
      response.should redirect_to (@post)
    end
  end
end
