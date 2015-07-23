require 'csv'

class PositionImporter

  def self.import(filename)
    all_positions = []
    CSV.table(filename).each_with_index do |position, index|
      position[:spread] = spread_converter(position[:spread])
      position[:location] = index+1
      all_positions << position.to_hash
    end
    all_positions
  end

  def self.spread_converter(spread_name)
    Spread.where(name: spread_name).first
  end

end
