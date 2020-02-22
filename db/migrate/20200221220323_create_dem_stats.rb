class CreateDemStats < ActiveRecord::Migration[6.0]
  def change
    create_table :dem_stats do |t|
      t.integer :start_year
      t.integer :male
      t.float :male_percentage
      t.integer :female
      t.float :female_percentage
      t.integer :white
      t.float :white_percentage
      t.integer :asian
      t.float :asian_percentage
      t.integer :black
      t.float :black_percentage
      t.integer :hispanic
      t.float :hispanic_percentage
      t.integer :multiracial
      t.float :multiracial_percentage
      t.integer :ell
      t.float :ell_percentage
      t.integer :poverty
      t.float :poverty_percentage
      t.integer :disability
      t.float :disability_percentage
      t.belongs_to :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
