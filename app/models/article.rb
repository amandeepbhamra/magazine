class Article < ActiveRecord::Base

	acts_as_paranoid

	belongs_to :user, foreign_key: "author_id", counter_cache: true
	
	has_many :comments

	validates :title, presence: :true

end