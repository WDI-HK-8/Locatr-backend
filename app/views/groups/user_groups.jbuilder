json.array! @groups do |group|
  json.id group.id
	json.name group.name
	json.created_at group.created_at
	json.image group.image
end
