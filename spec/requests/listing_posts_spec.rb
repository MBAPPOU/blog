require 'spec_helper'

describe "ListingPosts" do
  describe "GET /posts" do
    before(:each) do
      @post1 = Post.create(:title => "sujet1", :body => "bla bla")
      @post2 = Post.create(:title => "sujet2", :body => "bla bla")
    end

    describe "GET /posts" do
      it "generates a listing of posts" do
        visit posts_path
        page.should have_content @post1.title
        page.should have_content @post2.title
      end
    end
    
    describe "GET /posts/new " do
       it "should create a new post" do
         visit posts_path
         click_link 'Create a new Post'
         fill_in 'post_title', :with => 'nouveau post'
         fill_in 'post_body', :with => 'Coucou un nouveau post !'
         click_button 'Create'
         current_path.should == '/posts'
       end
    end
    
    describe "GET /posts/:id " do
       it "should print a post" do
         visit posts_path
         click_link 'Look'
         click_link 'Back'
         current_path.should == '/posts'
       end
    end
    
    describe "GET /posts/:id/edit " do
       it "should print a post" do
         visit posts_path
         click_link 'Look'
         current_path.should == "/posts/#{@post1.id}"
         click_link 'Edit'
         current_path.should == "/posts/#{@post1.id}/edit"
         current_path.should == "/posts/#{@post1.id}/edit"
       end
    end
    
    describe "PUT /posts/:id" do
       it "should update a post" do
         visit posts_path
         click_link 'Look'
         current_path.should == "/posts/#{@post1.id}"
         click_link 'Edit'
         current_path.should == "/posts/#{@post1.id}/edit"
         fill_in 'post_title', :with => 'Hello'
         fill_in 'post_body', :with => 'word !'
         click_button 'Post'
         current_path.should == "/posts/#{@post1.id}"
       end
    end
    
    describe "DELETE /posts/:id" do
       it "should delete a post" do
         visit posts_path
         click_link 'Delete'
         current_path.should == "/posts"
       end
    end
  end
end
