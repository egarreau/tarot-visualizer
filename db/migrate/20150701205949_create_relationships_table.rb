class CreateRelationshipsTable < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :influencer
      t.references :influencee
      t.boolean :positive, null: false

      t.timestamps null:false
    end
  end
end
