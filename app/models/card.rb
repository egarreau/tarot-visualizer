require_relative '../../db/config'

class Card < ActiveRecord::Base
  belongs_to :position
  belongs_to :suit

  has_many :influencer_relationships, foreign_key: 'influencer_id', class_name: :Relationship
  has_many :influencee_relationships, foreign_key: 'influencee_id', class_name: :Relationship

  has_many :influencers, through: :influencee_relationships, source: :influencer
  has_many :influencees, through: :influencer_relationships, source: :influencee

  def name
    if self.suit.name == 'major arcana'
      "#{self.value.capitalize}"
    else
      "#{self.value.capitalize} of #{self.suit.name.capitalize}"
    end
  end
end
