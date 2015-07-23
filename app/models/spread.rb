class Spread < ActiveRecord::Base
  has_many :positions
  has_many :cards, through: :positions
end
