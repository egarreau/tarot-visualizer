class CreateSuitsTable < ActiveRecord::Migration
  def change
    create_table :suits do |t|
      t.string :name, null: false
      t.string :keywords

      t.timestamps null:false
    end
  end
end
