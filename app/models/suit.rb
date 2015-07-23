class Suit < ActiveRecord::Base
  has_many :cards

  def keyword_array
    self.keywords.split('/')
  end
end

