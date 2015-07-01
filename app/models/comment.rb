class Comment < ActiveRecord::Base

	acts_as_paranoid

	belongs_to :article, 	counter_cache: true
	belongs_to :user, 		counter_cache: true
	
	belongs_to :reply_of, 	:class_name => "Comment", :foreign_key => "reply_comment_id", counter_cache: :replies_count

	has_many :replies, 		:class_name => "Comment", :foreign_key => "reply_comment_id"
						
end
