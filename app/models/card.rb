class Card < ActiveRecord::Base
  belongs_to :position
  belongs_to :suit

  has_many :influencer_relationships, foreign_key: 'influencer_id', class_name: :Relationship
  has_many :influencee_relationships, foreign_key: 'influencee_id', class_name: :Relationship

  has_many :influencers, through: :influencee_relationships, source: :influencer
  has_many :influencees, through: :influencer_relationships, source: :influencee

  def name
    if self.suit.name == 'major arcana'
      "#{self.value}"
    else
      "#{self.value.capitalize} of #{self.suit.name.capitalize}"
    end
  end

  def keyword_array
    self.keywords.split('/')
  end

  def positive_relationships
    self.influencee_relationships.select do |relationship|
      relationship.positive
    end
  end

  def negative_relationships
    self.influencee_relationships.select do |relationship|
      !relationship.positive
    end
  end

  def positive_influencer_of
    positive_influences = self.influencer_relationships.map do |relationship|
      if relationship.positive
        relationship.influencee
      end
    end
    positive_influences.compact
  end

  def negative_influencer_of
    negative_influences = self.influencer_relationships.map do |relationship|
      if !relationship.positive
        relationship.influencee
      end
    end
    negative_influences.compact
  end

  def positive_ids
    id_array = positive_influencer_of.map do |influencee|
      if influencee.position && influencee.position.spread == self.position.spread
        "positive-#{influencee.id}"
      end
    end
    id_array.compact.join(" ")
  end

  def negative_ids
    id_array = negative_influencer_of.map do |influencee|
      if influencee.position && influencee.position.spread == self.position.spread
        "negative-#{influencee.id}"
      end
    end
    id_array.compact.join(" ")
  end

end
