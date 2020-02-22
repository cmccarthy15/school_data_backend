class CreateBdns < ActiveRecord::Migration[6.0]
  def change
    create_table :bdns do |t|
      t.string :code

      t.timestamps
    end
  end
end
