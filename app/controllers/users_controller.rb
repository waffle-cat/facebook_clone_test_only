class UsersController < ApplicationController
	def index

	end

	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)

		if user.save
			redirect_to "/user/user.id"
		else
			render :new
		end

	end

	def edit
		@user = user.find(params[:id])
	end

	def update
	end

	def destroy
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end


