class WelcomeController < ApplicationController

  	def index
    	@articles = Article.all
    	@models = Model.all
  	end

  	def show
		@model = Model.find(params[:id])
	end

	def new
		@model = Model.new
	end
	
end
