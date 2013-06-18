class Question < ActiveRecord::Base
  attr_accessible :state, :rate, :title, :content, :page_view, :tags, :replied_at, :selected_id, :due_date, :user_id
  belongs_to :user
  has_many :answers
end
