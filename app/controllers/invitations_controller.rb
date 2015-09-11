class InvitationsController < ApplicationController
	def new_invitation	
		@id = User.where(phone_number: params[:invited_phone_number], accept_invites: true).first.id
		@invitation = Invitation.new(invitation_params.merge(user_id: @id,user_sent_by_id: params[:user_id], group_id: params[:group_id], accepted: false, rejected: false))

		if @invitation.save
      # render success in Jbuilder
    else
      render json: { message: "400 Bad Request" }, status: :bad_request
    end
	end

	def invitations_sent
		@invitations = Invitation.where(user_sent_by_id: params[:user_id])
	end

	def invitations_received
		@invitations = Invitation.where(user_id: params[:user_id], accepted: false, rejected: false)
	end

	def accept_invitation
		@invitation = Invitation.find_by_id(params[:id])

		if @invitation.nil?
      render json: { message: "Cannot find item" }, status: :not_found
    else
      @invitation.update(invitation_accept_or_reject_params)
    end
	end

	private
	def invitation_params
		params.require(:invitation).permit(:text, :accepted, :rejected)
	end

	def invitation_accept_or_reject_params
		params.require(:invitation).permit(:accepted, :rejected)
	end
end
