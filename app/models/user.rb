class User < ActiveRecord::Base
  	
  	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  	has_many :articles, foreign_key: "author_id"
  	has_many :comments
  	
end
