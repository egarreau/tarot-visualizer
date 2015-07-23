class CreateCardsTable < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :position
      t.references :suit, null: false
      t.string :value, null: false
      t.string :keywords

      t.timestamps null:false
    end
  end
end
