class CreateFavs < ActiveRecord::Migration
  def change
    create_table :favs do |t|
      t.integer :user_id
      t.integer :topic_id
      t.string :kind

      t.timestamps
    end
  end
end
