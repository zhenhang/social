class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :state
      t.integer :rate
      t.string :title
      t.text :content
      t.integer :page_view
      t.string :node
      t.string :tags
      t.integer :last_reply_id
      t.string :last_reply_user_name
      t.datetime :replied_at

      t.timestamps
    end
  end
end
