require 'spec_helper'
describe PostsController do
  describe "GET 'index'" do
    before(:each) do
      @posts = [stub_model(Post,:title => "1"), stub_model(Post, :title => "2")]
      Post.stub(:all){ @posts }
    end
    it "assigns a list of posts" do
      Post.should_receive(:all).and_return(@posts)
      get 'index'
      assigns(:posts).should eq @posts
      response.should be_success
    end

    it "renders the template list" do
      get 'index'
      response.should render_template(:index)
    end
  end
  
  describe "GET 'new'" do
    before(:each) do
      @post = stub_model(Post,:title => "1")
      Post.stub(:new){ @post }
    end
    it "assigns an empty post" do
      Post.should_receive(:new).and_return(@post)
      get 'new'
      assigns(:post).should eq @post
      response.should be_success
    end

    it "renders a formular to create a new post" do
      get 'new'
      response.should render_template(:new)
    end
  end
  
  describe "GET 'show'" do
    before(:each) do
      @post = stub_model(Post,:title => "1",:body => " Hello")
      Post.stub(:find_by_id){ @post }
    end
    it "assigns a post" do
      Post.should_receive(:find_by_id).and_return(@post)
      get 'show'
      assigns(:post).should eq @post
      response.should be_success
    end

    it "renders a post" do
      get 'show'
      response.should render_template(:show)
    end
  end
  
  describe "GET 'edit'" do
    before(:each) do
      @post = stub_model(Post,:title => "1",:body => " Hello")
      Post.stub(:find_by_id){ @post }
    end
    it "assigns a post" do
      Post.should_receive(:find_by_id).and_return(@post)
      get 'edit'
      assigns(:post).should eq @post
      response.should be_success
    end

    it "renders a post to edit in a formular" do
      get 'edit'
      response.should render_template(:edit)
    end
  end
  
  describe "GET 'destroy'" do
    before(:each) do
      @post = stub_model(Post,:title => "1",:body => " Hello")
      Post.stub(:find_by_id){ @post }
      @post.stub(:destroy)
    end
    it "assigns a post" do
      Post.should_receive(:find_by_id).and_return(@post)
      get 'destroy'
      assigns(:post).should eq @post
    end

    it "renders a list of post after redirection" do
      get 'destroy'
      response.should be_redirect
    end
  end
end
