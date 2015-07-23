require 'csv'

class RelationshipImporter

  def self.import(filename)
    all_relationships = []
    CSV.table(filename).each do |relationship|
      relationship[:positive] = self.positive?(relationship[:keyword])
      relationship[:influencer] = self.card_matcher(relationship[:influencer])
      relationship[:influencee] = self.card_matcher(relationship[:influencee])
      relationship.delete(:keyword)
      all_relationships << relationship.to_hash
    end
    all_relationships
  end

  def self.positive?(keyword)
    keyword == 'reinforcing' ? true : false
  end

  def self.card_matcher(card_name)
    if card_name =~ /\d/
      matcher = /(\d+)( of )([a-z]+)/i
      value = matcher.match(card_name)[1]
      suit = matcher.match(card_name)[3]

      Card.where(value: value).each do |card|
        return card if card.suit.name == suit
      end

    else
      # Card.find_by(value: card_name)
      Card.find_by("lower(value) = ?", card_name.downcase)
    end
  end

end
