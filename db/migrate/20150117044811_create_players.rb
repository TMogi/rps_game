class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :hp
      t.integer :atk
      t.integer :dif

      t.timestamps
    end
  end
end
