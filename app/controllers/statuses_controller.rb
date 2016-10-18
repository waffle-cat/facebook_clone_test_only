class StatusesController < ApplicationController

	def index

	end

	def new
		@status = Status.new
	end

	def create
		status = current_user.statuses.new(status_params)

		if status.save
			flash[:notice] = "Status is created successfully."
			redirect_to "/statuses/#{status.id}"
		else
			flash[:alert] = "Error creating status."
			render :new
		end
	end

	def show

	end

	def edit
		@status = Status.find(params[:id])
	end

	def update
		@status = Status.find(params[:id])

		if @status.update(status_params)
			flash[:notice] = "Status is updated successfully."
			redirect_to status_path
		else
			render :edit
		end 
	end

	def destroy

		status = Status.find(params[:id])
		status.destroy

		flash[:notice] = "Status is deleted."
		redirect_to statuses_path
	end

	private
		def status_params
			params.require(:status).permit(:title, :content)
		end

end
