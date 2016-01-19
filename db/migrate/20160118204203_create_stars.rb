class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.string :star_name, null: false
      t.string :right_ascension, null: false
      t.string :declination, null: false
      t.string :distance, null: false, default: "Unknown"
      t.string :temperature, null: false, default: "Unknown"
      t.string :stellar_age, null: false, default: "Unknown"
      t.string :stellar_mass, null: false, default: "Unknown"
      t.string :stellar_radius, null: false, default: "Unknown"
      t.string :spectral_type, null: false, default: "Unknown"
      t.string :density, null: false, default: "Unknown"
      t.string :surface_gravity, null: false, default: "Unknown"
      t.string :luminosity, null: false, default: "Unknown"
      t.string :absolute_magnitude, null: false, default: "Unknown"

    end
  end
end
