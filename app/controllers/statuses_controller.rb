class StatusesController < ApplicationController

	def index

	end

	def new

	end

	def create
		status = Status.new(status_params)

		if status.save
			
		else
			render :new
		end
	end

	def show

	end

	def edit

	end

	def update
	end

	def destroy
	end

	private
		def status_params
			params.require(:user).permit(:title, :content)
		end

end
