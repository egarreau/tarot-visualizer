require_relative '../lib/card_importer.rb'
require_relative '../lib/suit_importer.rb'
require_relative '../lib/position_importer.rb'
require_relative '../lib/relationship_importer.rb'

Spread.create!(name: "celtic cross")

all_positions = PositionImporter.import('db/data/positions.csv')
all_positions.each do |position|
  Position.create!(position)
end

all_suits = SuitImporter.import('db/data/suits.csv')
all_suits.each do |suit|
  Suit.create!(suit)
end

tarot_deck = CardImporter.import('db/data/cards.csv')
tarot_deck.each do |card|
  Card.create!(card)
end

all_relationships = RelationshipImporter.import('db/data/relationships.csv')
all_relationships.each do |relationships|
  Relationship.create!(relationships)
end
