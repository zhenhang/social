class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id, :rate, :state, :user_id, :floor
  belongs_to :user
  belongs_to :question
end
