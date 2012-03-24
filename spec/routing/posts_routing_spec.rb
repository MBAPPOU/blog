require 'spec_helper'
describe PostsController do 
  it "routes to #index" do 
    get('/posts').should route_to("posts#index")
  end

  it "should provide the aliast post_path for /posts" do 
    posts_path.should == '/posts'
  end
  
  it "routes to #new" do 
    get('/posts/new').should route_to("posts#new")
  end
  
  it "should provide the aliast new_post_path for /posts" do 
    new_post_path.should == '/posts/new'
  end
  
  it "routes to #create" do 
    post('/posts').should route_to("posts#create")
  end
  
  it "routes to #edit" do 
    get('/posts/:id/edit').should route_to("posts#edit")
  end
  
  it "should provide the aliast edit_post_path for /posts/:id/edit" do 
    edit_post_path.should == '/posts/:id/edit'
  end
  
  it "routes to #update" do 
    post ('/posts/update').should route_to("posts#update")
  end
  
  
end
