class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :datetime
      t.string :artsists
      t.string :venue
      t.string :city
      t.string :region
      t.string :country

      t.timestamps null: false
    end
  end
end
