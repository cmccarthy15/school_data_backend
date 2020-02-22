class CreateGenStats < ActiveRecord::Migration[6.0]
  def change
    create_table :gen_stats do |t|
      t.integer :start_year, null: false
      t.integer :total_enrollment, null: false
      t.float :economic_need
      t.belongs_to :school, null: false, foreign_key: true


      t.timestamps
    end
  end
end
