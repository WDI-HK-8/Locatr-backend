class AddSilentAndAcceptInvitesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :silent, :boolean, default: false
  	add_column :users, :accept_invites, :boolean, default: true
  end
end
