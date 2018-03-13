class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :description
      t.integer :tag_id
      t.string :image_url
      t.string :latitude
      t.string :longitude

      t.timestamps

    end
  end
end
