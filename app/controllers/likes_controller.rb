class LikesController < ApplicationController
	def create
		status = Status.find(params[:like][:status])
		current_user_id = session[:user_id]

		# If the current_user has not liked before
		if status.likes.find_by(user_id: current_user_id) == nil
			like = status.likes.new
			like.user_id = current_user_id
			if like.save
			flash[:notice] = "You liked #{status.title}!"
				redirect_to root_path
			else
				
			end
		# If the current_user has liked before
		else
			flash[:alert] = "You liked before!"
			redirect_to root_path
		end
	end


	def destroy
		like = Like.find(params[:id])
		status = like.status
		
		like.destroy

		flash[:notice] = "You unlike."
		redirect_to status_path(status)
	end

end
