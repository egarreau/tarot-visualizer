require 'csv'

class CardImporter

  def self.import(filename)
    deck = []
    CSV.table(filename).each do |card|
      card[:suit] = suit_converter(card[:suit])
      deck << card.to_hash
    end
    deck
  end

  def self.suit_converter(suit_name)
    Suit.where(name: suit_name).first
  end
end
