class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.text :content

      t.timestamps
    end
  end
end
