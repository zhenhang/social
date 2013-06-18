class Fav < ActiveRecord::Base
  attr_accessible :kind, :topic_id, :user_id
  belongs_to :topics
  belongs_to :users
end
