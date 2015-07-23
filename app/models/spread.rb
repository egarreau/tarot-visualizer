class Spread < ActiveRecord::Base
  has_many :positions
  has_many :cards, through: :positions

  def deal
    card_array = Card.all.sample(self.positions.length)
    self.positions.each do |position|
      card_array[position.id-1].position = position
      p card_array[position.id-1]
    end
  end

end
