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

end
