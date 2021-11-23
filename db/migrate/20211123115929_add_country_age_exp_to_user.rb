class AddCountryAgeExpToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :country, :string
    add_column :users, :age, :integer
    add_column :users, :years_exp, :integer
  end
end
