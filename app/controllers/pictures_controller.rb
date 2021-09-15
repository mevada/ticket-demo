class PicturesController < ApplicationController
	def index
		@pictures = Picture.all
	end	

	def show
		@picture = Picture.find(params[:id])
	end	


	def new
		@picture = Picture.new
	end
	
	def create
		#@picture = Picture.new(imageable: product, picture_params)
		#@ticket =current_user.tickets
		
		p params.inspect

	    product = Product.find(params[:picture][:product_id])
		@picture = product.pictures.build(picture_params)
		if @picture.save
			redirect_to product
		else
			render :new	
		end

		

	end


	private

	def picture_params
		params.require(:picture).permit(:name)
		#params.require(:ticket).permit(:title ,:description ,:status, :category_id).merge(user_id: current_user.id)
	end	
	
end
