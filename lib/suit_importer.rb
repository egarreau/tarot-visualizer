require 'csv'

class SuitImporter

  def self.import(filename)
    all_suits = []
    CSV.table(filename).each do |suit|
      all_suits << suit.to_hash
    end
    all_suits
  end

end
