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
	
	protect_from_forgery except: [:hook]
  	
  	def hook
    	params.permit! # Permit all Paypal input params
    	status = params[:payment_status]
    	if status == "Completed"
      		@registration = Registration.find params[:invoice]
      		@registration.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    	end	
    	render nothing: true
  	end

	private
	  	def model_params
	    params.require(:model).permit(:name, :price, :description, :fileurl)
  	end
end
