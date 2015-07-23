class CreateSpreadTable < ActiveRecord::Migration
  def change
    create_table :spreads do |t|
      t.string :name, null: false

      t.timestamps null:false
    end
  end
end
