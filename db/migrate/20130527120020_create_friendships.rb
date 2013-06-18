class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :owner_id
      t.integer :target_id

      t.timestamps
    end
  end
end
