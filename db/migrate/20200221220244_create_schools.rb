class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.belongs_to :bdn, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
