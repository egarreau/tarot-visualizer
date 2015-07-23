class Relationship < ActiveRecord::Base
  belongs_to :influencer, class_name: :Card
  belongs_to :influencee, class_name: :Card
end
