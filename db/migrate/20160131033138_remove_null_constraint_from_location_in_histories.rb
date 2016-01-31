class RemoveNullConstraintFromLocationInHistories < ActiveRecord::Migration
  def change
    change_column :histories, :observation_location, :string, null: true
  end
end
