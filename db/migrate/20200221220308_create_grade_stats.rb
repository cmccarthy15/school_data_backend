class CreateGradeStats < ActiveRecord::Migration[6.0]
  def change
    create_table :grade_stats do |t|
      t.integer :start_year
      t.integer :grade_pk
      t.integer :grade_k
      t.integer :grade_1
      t.integer :grade_2
      t.integer :grade_3
      t.integer :grade_4
      t.integer :grade_5
      t.integer :grade_6
      t.integer :grade_7
      t.integer :grade_8
      t.integer :grade_9
      t.integer :grade_10
      t.integer :grade_11
      t.integer :grade_12
      t.belongs_to :school, null: false, foreign_key: true


      t.timestamps
    end
  end
end
