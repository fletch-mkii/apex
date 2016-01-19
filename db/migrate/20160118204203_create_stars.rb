class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.string :star_name, null: false
      t.float :right_ascension, null: false
      t.float :declination, null: false
      t.float :distance
      t.float :temperature
      t.float :stellar_age
      t.float :stellar_mass
      t.float :stellar_radius
      t.string :spectral_type
      t.float :density
      t.float :surface_gravity
      t.float :luminosity
    end
  end
end
