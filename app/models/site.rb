class Site < ActiveRecord::Base
  attr_accessible :ad, :config, :hot_node, :intro, :logo, :nav, :node_count, :notice,
   :reply_count, :state, :title, :top_topic_id, :topic_count, :url, :user_count
end
