class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :user_id
      t.integer :topic_id
      t.string :state
      t.string :kind, :dfault => 'topic'
      t.integer :rate
      t.text :content

      t.timestamps
    end
  end
end
