class BlogsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		#@blogs = current_user.blogs.order(:title)
		#@blogs = current_user.blogs.where(description: "abcd")
		#@blogs = current_user.blogs.where(user_id: current_user.id)
		#@blogs = Blog.all
		@blogs = current_user.blogs
	end


	def show
		@blog = Blog.find(params[:id])
	end	

	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
		if @blog.save
			redirect_to  blogs_path
		else
			render :new	
		end	
	end	


	def edit
		@blog = Blog.find(params[:id])
	end	

	def update
		@blog = Blog.find(params[:id])
    	if @blog.update(blog_params)
      		redirect_to @blog
    	else
      		render :edit
    	end
	end	

	def destroy
	    @blog = Blog.find(params[:id])
	    @blog.destroy

    	redirect_to blogs_path
  	end 

	private

	def blog_params
		params.require(:blog).permit(:title , :description).merge(user_id: current_user.id)	
	end		
end
