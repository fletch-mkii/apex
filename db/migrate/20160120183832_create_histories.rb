class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.belongs_to :user, index: true, null: false, unique: true
      t.belongs_to :star, index: true, null: false, unique: true
      t.string :observation_location, null: false
      t.timestamps null: false
    end
  end
end
