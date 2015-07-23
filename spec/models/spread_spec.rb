require_relative '../spec_helper'

describe Spread do

  before(:all) do
    DatabaseCleaner.start

    @ppf = Spread.create!(name: 'Past, Present, Future')

    @past = Position.create!(location: 1, spread: @ppf, keywords: 'past')
    @present = Position.create!(location: 2, spread: @ppf, keywords: 'present')
    @future = Position.create!(location: 3, spread: @ppf, keywords: 'future')

    @major_arcana = Suit.create!(name: 'major arcana')
    @coins = Suit.create!(name: 'coins')

    @magician = Card.create!(position: @past, suit: @major_arcana, value: 'magician', keywords: 'action/conscious awareness/concentration/power')
    @high_priestess = Card.create!(position: @present, suit: @major_arcana, value: 'high priestess', keywords: 'non-action/unconscious awareness/potential/mystery')
    @eight_coins = Card.create!(position: @future, suit: @coins, value: '8', keywords: 'deeper meaning/moving on/weariness')

    @mag_priestess = Relationship.create!(influencer: @magician, influencee: @high_priestess, positive: false)
    @eight_priestess = Relationship.create!(influencer: @high_priestess, influencee: @eight_coins, positive: true)
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  it 'has positions' do
    expect(@ppf.positions).to match_array [@past, @present, @future]
  end

  it 'has cards' do
    expect(@ppf.cards).to match_array [@magician, @high_priestess, @eight_coins]
  end

end
