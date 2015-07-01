class AddCounterCacheColumnsToTables < ActiveRecord::Migration
  	
  	def change
  		add_column :users, :articles_count, :integer, :default => 0
  		add_column :users, :comments_count, :integer, :default => 0
  		add_column :articles, :comments_count, :integer, :default => 0
  		add_column :comments, :replies_count, :integer, :default => 0
  	end

end