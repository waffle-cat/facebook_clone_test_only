class SessionsController < ApplicationController
	skip_before_action :login_required, :only => [:new, :create] 
   
	def new   
		@user = User.new 
	end 

	def create   
		user = User.find_by_email(session_params[:email])
		if user && user.authenticate(session_params[:password])
			session[:user_id] = user.id  
			flash[:notice] = "Welcome, #{user.email}!"     
			redirect_to statuses_path
		else
			flash[:alert] = "Please log in again"
			render "new"
		end
	end

	def destroy   
		session[:user_id] = nil
		redirect_to root_path 
	end 

	private
		def login(user)
			session[:user_id] = nil
		end

		def session_params
			params.require(:session).permit(:email, :password)
		end

end
