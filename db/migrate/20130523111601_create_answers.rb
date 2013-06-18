class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_d
      t.integer :question_id
      t.string :state
      t.integer :rate
      t.text :content

      t.timestamps
    end
  end
end
