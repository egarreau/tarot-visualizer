require_relative '../../db/config'

class Position < ActiveRecord::Base
  belongs_to :spread
  has_one :card
end
