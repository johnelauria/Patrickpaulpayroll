class SessionsController < ApplicationController
 	def new
 	end

	def create
		employee = Employee.find_by_username(params[:session][:username])
		if employee && employee.authenticate(params[:session][:password])
			sign_in employee
			redirect_to employee
		else
			flash[:error] = "Invalid username / password combination"
			redirect_to signin_path
		end
	end

	def destroy
		signout
		redirect_to root_path
		flash[:success] = "You have successfully signed out!"
	end
end
