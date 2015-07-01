class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.text 		:content, 			null: false
			t.integer 	:article_id, 		null: false
			t.integer 	:user_id, 			null: false
			t.integer 	:reply_comment_id
			t.datetime :deleted_at

			t.timestamps null: false
		end
	end
end
