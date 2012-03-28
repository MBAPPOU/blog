require 'spec_helper'
describe PostsController do

          before do
           @post1 = Post.create(:title => "sujet1", :body => "bla bla")
           @post2 = Post.create(:title => "sujet2", :body => "bla bla")
          end

      describe 'Routing Layer' do        
          it "routes to #index" do 
            get('/posts').should route_to("posts#index")
          end

          it "should provide the aliast post_path for /posts" do 
            posts_path.should == '/posts'
          end
          
          it "routes to #new" do 
            get('/posts/new').should route_to("posts#new")
          end
          
          it "should provide the aliast new_post_path for /posts/new" do 
            new_post_path.should == '/posts/new'
          end
          
          it "routes to #create" do 
            post('/posts').should route_to("posts#create")
          end
          
          it "should provide the aliast post_path for /posts/:id" do
             post_path(@post1).should == "/posts/#{@post1.id}"
          end
          
          it "routes to #show" do
            get ( "/posts/#{@post1.id}" ).should route_to("posts#show")
          end
       end
end
