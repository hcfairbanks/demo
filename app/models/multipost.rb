class Multipost < ActiveRecord::Base
  belongs_to :post
  belongs_to :community
end
