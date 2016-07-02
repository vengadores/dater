class Property < ActiveRecord::Base
  validates :pv_id, uniqueness: true
end
