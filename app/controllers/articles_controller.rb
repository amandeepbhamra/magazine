class ArticlesController < ApplicationController
	
	skip_before_filter :authenticate_user!, only: [:public]

	before_action :validate_user
	
	before_action :set_article, only: [:show, :edit, :update, :destroy]
	
	
	def index
		@articles = @user.articles.order("updated_at DESC").paginate(:page => params[:page], :per_page => 20) unless @user.blank?
	end

	def public
		@articles = Article.order("updated_at DESC").paginate(:page => params[:page], :per_page => 9)
	end

	def show
		@comments = @article.comments.includes(:replies).where("reply_comment_id IS ?", nil)
		@comment = @article.comments.build
	end

	def new
		@article = @user.articles.build
	end

	def edit
	end

	def create
		@article = @user.articles.build(article_params)

		respond_to do |format|
			if @article.save
				format.html { redirect_to [@user, @article], notice: 'Article was successfully created.' }
			else
				format.html { render :new }
			end
		end
	end

	def update
		respond_to do |format|
			if @article.update(article_params)
				format.html { redirect_to [@user, @article], notice: 'Article was successfully updated.' }
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		@article.destroy
		respond_to do |format|
			format.html { redirect_to [@user, :articles], notice: 'Article was successfully destroyed.' }
		end
	end

	private

	def validate_user
		@user = User.find_by_id(params[:user_id]) if defined? params[:user_id] or !params[:user_id].blank?
 	end

 	def set_article
		@article = @user.articles.find_by_id(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def article_params
		params.require(:article).permit(:title, :body, :author_id)
	end

end