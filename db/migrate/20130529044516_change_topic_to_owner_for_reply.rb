class ChangeTopicToOwnerForReply < ActiveRecord::Migration
  def up
  	add_column :replies, :repliable_id, :integer
  	add_column :replies, :repliable_type, :string
  	remove_column :replies, :topic_id
  	remove_column :replies, :kind
  end

  def down
  end
end
