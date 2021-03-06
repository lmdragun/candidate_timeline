class ArticlesController < ApplicationController
  before_action :find_article, only: [:edit, :update, :destroy]

  before_action :authenticate_user!

  	def index
  		@articles = Article.all
      @healthcare = @articles.where(topic: 3)
      @guncontrol = @articles.where(topic: 1)
      @education = @articles.where(topic: 2)
      @civilrights = @articles.where(topic: 4)
      @economy = @articles.where(topic: 5)
  	end

    def new
  		@article = Article.new
  	end

  	def show
      search_term = params[:nyt]
      key = ENV['nytimes_api_key']
      nytimes = HTTParty.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=#{search_term}&api-key=#{key}")
      @results = nytimes["response"]["docs"]
  	end

  	def edit

  	end

  	def create
  		@article = Article.create!(article_params)
  		redirect_to @article
  	end

  	def update
  		@article.update(article_params)
  		redirect_to @article
  	end

  	def destroy
  		@article.destroy
  		redirect_to article_url
  	end


    private

    def article_params
      return params[:article].permit(:title, :url, :date)
    end

    def find_article
      @article = Article.find(params[:id])
    end


end
