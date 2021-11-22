class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :place
      t.float :latitude
      t.float :longitude
      t.datetime :start_date
      t.datetime :end_date
      t.integer :capacity_max
      t.boolean :is_full, default: false
      t.references :owner, null: false, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
