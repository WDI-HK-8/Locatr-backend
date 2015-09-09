Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
    
  resources :groups do 
    resources :group_users
    resources :invitations
  end

  get '/users/:user_id/group_users' => 'groups#user_groups'
  post '/users/:user_id/groups/:group_id/invitation/:invited_phone_number' => 'invitations#new_invitation'
  get '/users/:user_id/received' => 'invitations#invitations_received'
  get '/users/:user_id/sent' => 'invitations#invitations_sent'
  put '/invitation/:id' => 'invitations#accept_invitation'

end
