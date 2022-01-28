class CategoriesController < ApplicationController
	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

	def index
		@category = Category.paginate(page: params[:page], per_page: 10)
		#@category = Category.find(params[:id])
	end	

	def show
		@category = Category.find(params[:id])
	end	


	def new
		@category = Category.new
	end	

	def create
		@category = Category.new(category_params)
		respond_to do |format|
			if @category.save
				format.html { redirect_to categories_path}
				format.json { render :show, status: :created, location: @category }	
			else
				format.html { render :new }
				format.json { render json: @category.errors, status: :unprocessable_entity }	
			end
		end
	end	

	def edit
		@category = Category.find(params[:id])
	end	
	def update
		@category = Category.find(params[:id])
    	if @category.update(category_params)
      		redirect_to @category
    	else
      		render :edit
    	end
	end	

  	def destroy
	    @category = Category.find(params[:id])
	    @category.destroy

    	redirect_to root_path
  	end  
  

  	protected
  	def configure_permitted_parameters
  		puts "===================="
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  	end	

	private

	def category_params
		params.require(:category).permit(:name)
	end

end
