class Post < ActiveRecord::Base
  validates :body,  :presence => true
  validates :title, :presence => true, :uniqueness => true
 
  has_many :comments,:dependent => :destroy
end
