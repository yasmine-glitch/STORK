class AddDescriptionToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :description, :string
  end
end
