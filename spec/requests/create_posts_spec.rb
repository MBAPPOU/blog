require 'spec_helper'

describe "Create Posts" do
  describe "GET /posts/create_posts" do
    it "should return a formular to write a new post" do
      visit create_posts_path
      clik_link 'create_post'
      fill_in 'message', :with => 'Coucou un nouveau post'
      clik_button 'Post'
      current_path.should == posts_path
      response.status.should be(200)
    end
  end
end
