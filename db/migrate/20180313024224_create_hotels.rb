class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.integer :stars
      t.integer :min_cost
      t.integer :destination_id

      t.timestamps

    end
  end
end
