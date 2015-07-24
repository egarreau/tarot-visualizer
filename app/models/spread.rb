require 'unirest'

class Spread < ActiveRecord::Base
  has_many :positions
  has_many :cards, through: :positions, source: :card

  def deal
    card_array = Card.all.sample(self.positions.length)
    self.positions.each do |position|
      card_array[position.id-1].position = position
      card_array[position.id-1].save
    end
  end

  def scrap
    # self.positions.each do |position|
    #   position.card = nil
    #   position.save
    #   card.save
    # end
    self.cards.each do |card|
      pos = card.position
      card.position_id = nil
      card.save
      puts pos
      puts pos.card
    end
  end

  def all_words
    word_array = []

    self.positions.each do |position|
      word_array << position.card.keyword_array
      word_array << position.card.suit.keyword_array
    end
    word_array.flatten.join(" ")
  end

  def word_cloud
    response = Unirest.post "https://wordcloudservice.p.mashape.com/generate_wc",
                            headers:{
                              "X-Mashape-Key" => "viyNuEGftbmshzD4lajIG7gypQPPp101GjzjsnXnaNUz3efMjt",
                              "Content-Type" => "application/json",
                              "Accept" => "application/json"
                            },
                            parameters:{
                              :f_type => "png",
                              :width => 800,
                              :height => 500,
                              :s_max => "7",
                              :s_min => "1",
                              :f_min => 1,
                              :r_color => "TRUE",
                              :r_order => "TRUE",
                              :s_fit => "FALSE",
                              :fixed_asp => "TRUE",
                              :rotate => "TRUE",
                              :textblock => "#{self.all_words}"
                            }.to_json
    response.body["url"]
  end

end
