class StLmodelController < ApplicationController
	def index
	    @st_lmodels = St_lmodel.all
	end
	   
	def new
	    @st_lmodel = St_lmodel.new
	end
	   
   def create
	    @st_lmodel = St_lmodel.new(resume_params)
	      
	    if @st_lmodel.save
	    	redirect_to resumes_path, notice: "The resume #{@resume.name} has been uploaded."
	    else
	        render "new"
	    end
	end
	   
	def destroy
	    @st_lmodel = St_lmodel.find(params[:id])
	    @st_lmodel.destroy
	    redirect_to st_lmodel_path, notice:  "The resume #{@resume.name} has been deleted."
	end
	   
	private
    def resume_params
	    params.require(:resume).permit(:name, :attachment)
	end
end
