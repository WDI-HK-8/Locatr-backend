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

	def user_groups
		@group_users = GroupUser.where(user_id: params[:user_id])
		@groups = []

		@group_users.each do |group_user|
			@groups << group_user.group
		end

		return @groups
	end

	private 

	def group_params
    params.require(:group).permit(:name, :image)
  end
end
