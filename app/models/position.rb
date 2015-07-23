class Position < ActiveRecord::Base
  belongs_to :spread
  has_one :card
end
