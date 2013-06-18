class Friendship < ActiveRecord::Base
  attr_accessible :owner_id, :target_id
end
