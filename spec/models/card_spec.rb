require_relative '../spec_helper'

describe Card do

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

  it "has a position" do
    expect(@magician.position).to eq @past
  end

  it "has a suit" do
    expect(@eight_coins.suit).to eq @coins
  end

  it "has a value" do
    expect(@eight_coins.value).to eq "8"
  end

  it "has a name" do
    expect(@eight_coins.name).to eq "8 of Coins"
    expect(@magician.name).to eq "Magician"
  end

  it "has keywords" do
    expect(@high_priestess.keywords).to eq 'non-action/unconscious awareness/potential/mystery'
  end

  it "has influencer relationships" do
    expect(@high_priestess.influencer_relationships).to match_array [@eight_priestess]
  end

  it "has influencee relationships" do
    expect(@high_priestess.influencee_relationships).to match_array [@mag_priestess]
  end

  it "has influenced cards" do
    expect(@high_priestess.influencees).to match_array [@eight_coins]
  end

  it "has cards that influence it" do
    expect(@high_priestess.influencers).to match_array [@magician]
  end
end
