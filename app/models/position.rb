class Position < ActiveRecord::Base
  belongs_to :spread
  has_one :card

  def keyword_array
    self.keywords.split('/')
  end

end

