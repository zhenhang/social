class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :state
      t.integer :rate
      t.string :title
      t.text :content
      t.integer :page_view
      t.string :tags
      t.timestamps
    end
  end
end
