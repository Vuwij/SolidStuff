class ModelsController < ApplicationController
	@@currentModel = 0;

	def index
		@models = Model.all
	end
	
	def show
		@model = Model.find(params[:id])
	end

	def new
		@model = Model.new
	end

	def create
		@model = Model.new(model_params)

    	if @model.save
    		redirect_to @model
    	else
      		render 'new'
    	end
	end
	
	def destroy
    	@model = Model.find(params[:id])
    	@model.destroy
    	redirect_to welcome_path
  	end
	
	private
	  	def model_params
	    params.require(:model).permit(:name, :price, :description, :fileurl)
  	end
end
