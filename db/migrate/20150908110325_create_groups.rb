class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.string :name
    	t.attachment :image
      t.timestamps null: false
    end
  end
end
