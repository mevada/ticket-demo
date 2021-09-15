class ProductsController < ApplicationController
	def index
		@products = current_user.products
	end	

	def show
		@product = Product.find(params[:id])
		
	end
	

	def new
		@product = Product.new
		@pictures = @product.pictures.build
	end	

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to products_path
		else
			render :new	
		end
	end

	private

	def product_params
		p params.inspect
		params.require(:product).permit(:name , pictures_attributes: [ :id , :name , :imageable_type ,:imageable_id ]).merge(user_id: current_user.id)
		#params.require(:product).permit(:name, pictures: [ :name , :imageable_type ,:imageable_id ]).merge(user_id: current_user.id)
	end

end
