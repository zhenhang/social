class Reply < ActiveRecord::Base
  attr_accessible :content, :rate, :state, :owner_id, :user_id, :floor, :repliable
  belongs_to :user
  belongs_to :repliable, :polymorphic => true
end
