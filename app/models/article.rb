class Article < ActiveRecord::Base
  attr_accessible :content, :page_view, :rate, :state, :tags, :title, :user_id
  belongs_to :user
  has_many :replies, :as => :repliable
end
