json.array! @invitations do |invitation|
	json.id invitation.id
	json.user_id invitation.user_id
	json.group_id invitation.group_id
	json.user_sent_by_id invitation.user_sent_by_id
	json.text invitation.text
	json.accepted invitation.accepted
	json.sent_by User.find_by_id(invitation.user_sent_by_id).name
	json.group_to_join invitation.group.name
	json.rejected invitation.rejected
	json.created_at invitation.created_at
end