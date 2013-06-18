class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :title
      t.string :intro
      t.string :url
      t.string :logo
      t.integer :node_count
      t.integer :user_count
      t.integer :topic_count
      t.integer :reply_count
      t.string :nav, :limit => 2047
      t.string :notice
      t.string :hot_node
      t.integer :top_topic_id
      t.string :ad
      t.string :state
      t.string :config

      t.timestamps
    end
  end
end
