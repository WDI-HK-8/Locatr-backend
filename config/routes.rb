Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
    
  resources :groups do 
    resources :group_users
    resources :invitations
  end



end
