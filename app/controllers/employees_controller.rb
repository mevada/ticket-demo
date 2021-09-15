class EmployeesController < ApplicationController
	def index
		@employees =current_user.employees
	end	
	
	def show
		@employee = Employee.find(params[:id])
	end	
		

	def new
		@employee = Employee.new
		@pictures = @employee.pictures.build
	end	

	def create
		@employee = Employee.new(employee_params)
		if @employee.save
			redirect_to employees_path
		else
			render :new	
		end

	end	


	private

	def employee_params
		params.require(:employee).permit(:name, pictures_attributes: [ :id , :name , :imageable_type ,:imageable_id ]).merge(user_id: current_user.id)
	end


end
