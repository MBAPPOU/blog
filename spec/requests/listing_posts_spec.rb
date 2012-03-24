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
         click_link 'create post'
         fill_in 'post_title', :with => 'nouveau post'
         fill_in 'post_body', :with => 'Coucou un nouveau post !'
         click_button 'Post'
         current_path.should == '/posts'
       end
    end
    
    describe "GET  /post/edit " do
       it "should edit a post" do
          visit posts_path
          click_link 'create post'
          fill_in 'post_title', :with => 'Hello'
          fill_in 'post_body', :with => 'Just to say hi!'
          click_button 'Post'
          click_link 'Edit'
          fill_in 'post_title',:with => 'Bye'
          fill_in 'post_body',:with => 'Goodbye'
          click_button 'Post'
          page.should have_content "Bye"
       end
    end
    
    
  end
end
