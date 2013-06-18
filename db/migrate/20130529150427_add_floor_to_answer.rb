class AddFloorToAnswer < ActiveRecord::Migration
  def change
  	add_column :answers, :floor, :integer, :default => 0
  end
end
