require_relative '../../db/config'

class Suit < ActiveRecord::Base
  has_many :cards
end
