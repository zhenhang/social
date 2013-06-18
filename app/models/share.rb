class Share < ActiveRecord::Base
  attr_accessible :content, :last_reply_id, :last_reply_user_name, :node,
   :page_view, :replied_at, :rate, :state, :tags, :title, :user_id,
   :download_count, :file
   has_many :replies, :as => :repliable
   belongs_to :user
   has_attached_file :file
end
