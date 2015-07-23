class CreatePositionTable < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :spread, null: false
      t.integer :location, null:false
      t.string :keywords

      t.timestamps null:false
    end
  end
end
