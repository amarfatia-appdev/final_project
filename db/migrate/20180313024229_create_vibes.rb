class CreateVibes < ActiveRecord::Migration
  def change
    create_table :vibes do |t|
      t.string :name

      t.timestamps

    end
  end
end
