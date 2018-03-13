class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :min_cost
      t.integer :destination_id

      t.timestamps

    end
  end
end
