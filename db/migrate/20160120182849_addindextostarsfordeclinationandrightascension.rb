class Addindextostarsfordeclinationandrightascension < ActiveRecord::Migration
  def change
    add_index :stars, [:declination, :right_ascension]
  end
end
