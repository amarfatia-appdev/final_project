class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :vibe_id
      t.integer :destination_id

      t.timestamps

    end
  end
end
