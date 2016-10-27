class EmployeesController < ApplicationController
	def new
		@employee=Employee.new
	end

	def index
		@employees=Employee.all
	end

	def create
		binding.pry
		@employee=Employee.new(employee_params)
		@employee.save
		redirect_to employees_list_path
	end

	def edit
		@employee=Employee.find_by_id(params[:id])
	end

	def update
		@employee=Employee.find_by_id(params[:id])
		@employee.update_attributes(employee_params)
		redirect_to employees_list_path
	end

	def destroy
		@employee=Employee.find_by_id(params[:id])
		@employee.destroy
		redirect_to employees_list_path
	end

	private
	def employee_params
		params.require(:employee).permit(:first_name,:last_name,:email,:password)
	end
end
