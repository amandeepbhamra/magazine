class CommentsController < ApplicationController

	before_action :validate_article, only: [:new, :create, :destroy]
	before_action :set_comment, only: [:new, :create, :destroy]
	
	def new
		@comment 			= @article.comments.build
		@reply_comment_id 	= params[:reply_comment_id] if defined? params[:reply_comment_id] and !params[:reply_comment_id].blank?
        respond_to do |format|
            format.js
        end
	end
	
	def create
		@comment = @article.comments.build(comment_params)

		respond_to do |format|
			if @comment.save
				@parent_comment = @comment.reply_of unless @comment.reply_comment_id.blank?
                format.js
			else
				format.html { render :new }
			end
		end
	end
	
	def destroy
		@comment_id 		= @comment.id
		@reply_comment_id 	= @comment.reply_comment_id
		@comment.destroy

		respond_to do |format|
			format.js
		end
	end

	private
	
	def validate_article
		@article = Article.find_by_id(params[:article_id])
	end

	def set_comment
		@comment = @article.comments.find_by_id(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def comment_params
		params.require(:comment).permit(:content, :article_id, :commentor_id, :commentor_name, :reply_comment_id)
	end
end