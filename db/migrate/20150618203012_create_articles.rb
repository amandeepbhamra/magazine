class CreateArticles < ActiveRecord::Migration
	def change
		create_table :articles do |t|
			t.string :title, null: false
			t.text :body
			t.integer :author_id, null: false
			t.datetime :deleted_at

			t.timestamps null: false
		end
		add_index :articles, :deleted_at
	end
end
