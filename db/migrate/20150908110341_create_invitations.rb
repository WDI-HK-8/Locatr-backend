class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
    	t.belongs_to :user
    	t.belongs_to :group
    	t.integer :user_sent_by_id
    	t.string :text
    	t.boolean :accepted, :null => false, :default => false
    	t.boolean :rejected, :null => false, :default => false
      t.timestamps null: false
    end
  end
end
