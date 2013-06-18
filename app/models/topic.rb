class Topic < ActiveRecord::Base
  attr_accessible :content, :last_reply_id, :last_reply_user_name, :node,
   :page_view, :replied_at, :rate, :state, :tags, :title, :user_id

  has_many :replies, :as => :repliable
  has_many :favs
  belongs_to :user
  #has_many :users, :through => :favs
end
