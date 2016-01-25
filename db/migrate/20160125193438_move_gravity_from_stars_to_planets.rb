class MoveGravityFromStarsToPlanets < ActiveRecord::Migration
  def change
    remove_column :stars, :surface_gravity, :float
    add_column :planets, :surface_gravity, :float
  end
end
