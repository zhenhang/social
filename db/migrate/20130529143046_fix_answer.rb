class FixAnswer < ActiveRecord::Migration
  def up
  	remove_column :answers, :user_d
  	add_column :answers, :user_id, :integer
  end

  def down
  end
end
