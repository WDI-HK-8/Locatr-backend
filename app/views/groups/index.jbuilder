json.array! @groups do |group|
  json.id group.id
	json.name group.name
	json.image group.image
	json.created_at group.created_at
end
