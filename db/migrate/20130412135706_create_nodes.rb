class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :title
      t.string :summary
      t.integer :sort
      t.string :kind

      t.timestamps
    end
  end
end
