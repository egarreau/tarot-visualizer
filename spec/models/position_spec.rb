require_relative '../spec_helper'

describe Position do

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

  it 'has a spread' do
    expect(@past.spread).to eq @ppf
  end

  it 'has a location' do
    expect(@past.location).to eq 1
  end

  it 'has a card' do
    expect(@past.card).to eq @magician
  end

  it 'has keywords' do
    expect(@past.keywords).to eq 'past'
  end

end
