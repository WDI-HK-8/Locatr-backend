class GroupUsersController < ApplicationController
	def create
  	@group = Group.find_by_id(params[:group_id])
    @group_user = @group.group_users.find_or_create_by(group_users_params)

    if @group_user.save
      # render success in Jbuilder
    else
      render json: { message: "400 Bad Request" }, status: :bad_request
    end
  end

  def other_users
    @group_users_first = GroupUser.where(group_id: params[:group_id]).where.not(user_id: params[:id])
    @group_users = []
    @group_users_first.each do |group_user|
      if group_user.user.silent != true
        @group_users << group_user
      end
    end

    return @group_users
  end

  def remove
    @group_user = GroupUser.where(group_id: params[:group_id], user_id: params[:user_id]).delete_all

    render json: {message: "Successfully deleted"}
  end

  private

	def group_users_params
    params.require(:group_user).permit(:group_id, :user_id)
  end
end
