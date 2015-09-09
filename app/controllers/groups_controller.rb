class GroupsController < ApplicationController
	def index
		@groups = Group.all
	end

	def create
		@group = Group.new(group_params)

    if @group.save
      # render success in Jbuilder
    else
      render json: { message: "400 Bad Request" }, status: :bad_request
    end
	end

	private 
	
	def group_params
    params.require(:group).permit(:name, :image)
  end
end
