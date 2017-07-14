class ArticlesController < ApplicationController

	before_action :set_article, only: [:edit, :update, :show, :destroy]

	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article #redirect the user to the show action
		else
			render new_article_path
		end
	end

	def update

		if @article.update(article_params)
			redirect_to @article
		else
			render edit_article_path
		end
	end

	def show
	end

	def destroy
		@article.destroy
		redirect_to article_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end

		def set_article
			@article = Article.find(params[:id])
		end

end
