class UsersController < ApplicationController
	def update_coordinates
		@user = User.find_by_id(params[:id])

		if @user.nil?
      render json: { message: "Cannot find user" }, status: :not_found
    else
      @user.update(coordinates_params)
    end
	end

	private
	def coordinates_params
		params.require(:user).permit(:latitude, :longitude)
	end
end
