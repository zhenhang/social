class Gist < ActiveRecord::Base
  attr_accessible :content, :description, :title, :user_id
  has_many :replies, :as => :repliable
  belongs_to :user
end
