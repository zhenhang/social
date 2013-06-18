class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :state
      t.integer :rate
      t.string :title
      t.text :content
      t.integer :page_view
      t.string :tags
      t.datetime :replied_at
      t.integer :selected_id
      t.datetime :due_date
      t.timestamps
    end
  end
end
