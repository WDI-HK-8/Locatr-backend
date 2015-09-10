json.array! @group_users do |group_user|
	json.id group_user.id
	json.group_id group_user.group_id
	json.user_id group_user.user_id
	json.name group_user.user.name
	json.phone_number group_user.user.phone_number
	json.email group_user.user.email
end