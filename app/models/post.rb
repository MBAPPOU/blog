class Post < ActiveRecord::Base
  validates :body,  :presence => true
  validates :title, :presence => true, :uniqueness => true,
                    :length => { :minimum => 5 }
 
  has_many :comments
end
