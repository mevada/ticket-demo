class TicketsController < ApplicationController
	
	before_action :authenticate_user!
	#before_action :user_signed_in?
	#before_action :configure_permitted_parameters, if: :devise_controller?


	
	def index
		#@tickets = current_user.tickets.paginate(page: params[:page], per_page: 2)
		#@tickets = current_user.tickets
		#@tickets = current_user.tickets.paginate(page: params[:page])
		#@tickets = current_user.tickets.page(params[:page]).order('created_at DESC')
		#@posts = Post.paginate(page: params[:page])
		#@t1 = Ticket.where(status: 'public')
		#@tickets2 = Ticket.where(user_id: current_user.id)
		#p @tickets2
    	#@tickets = Ticket.all
		


    	if params[:title].present?
    		@tickets = current_user.tickets.where(title: params[:title]).paginate(page: params[:page], per_page: 2)	
    		unless @tickets.present?
    			@tickets = current_user.tickets.paginate(page: params[:page], per_page: 2)		 	
    		end 
    	else
    		@tickets = current_user.tickets.paginate(page: params[:page], per_page: 2)	
    	end	

    	p @tickets


 	 #  	@tickets = current_user.tickets.paginate(page: params[:page], per_page: 2)
    #	if params[:title].present?
    #		@tickets = current_user.tickets.where(title: params[:title]).paginate(page: params[:page], per_page: 2)
    #	end	
	end	

	def search
		p "###+++++++++"
		#@search = Ticket.where(['title LIKE?',"%#{params[:title]}%"])
		@search = current_user.tickets.where(title: params[:title])
		if @search.present?
			render :search
		else
	    	redirect_to tickets_path
		end	
	end	

	def show
		@ticket = Ticket.find(params[:id])
	end	

	def new
		@ticket = Ticket.new
	end	
	
	def create
		@ticket = Ticket.new(ticket_params)
		#@ticket =current_user.tickets
		if @ticket.save
			redirect_to @ticket
		else
			render :new	
		end	
	end	

	def edit
		@ticket = Ticket.find(params[:id])
	end	

	def update
		@ticket = Ticket.find(params[:id])
    	if @ticket.update(ticket_params)
      		redirect_to @ticket
    	else
      		render :edit
    	end
	end	

	def destroy
    	@ticket = Ticket. find(params[:id])
    	@ticket.destroy
    	p "*********"
    	redirect_to root_path
  	end  

  	
	




  	protected

  	def configure_permitted_parameters
  		puts "===================="
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  	end	

	private

	def ticket_params
		params.require(:ticket).permit(:title ,:description ,:status, :category_id, :user_id)
		#params.require(:ticket).permit(:title ,:description ,:status, :category_id).merge(user_id: current_user.id)
	end	
	
end
