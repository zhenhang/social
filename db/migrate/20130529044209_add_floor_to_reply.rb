class AddFloorToReply < ActiveRecord::Migration
  def change
  	add_column :replies, :floor, :integer, :default => 0
  end
end
