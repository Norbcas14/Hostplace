class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :country
      t.string :address
      t.text :description
      t.string :latitude
      t.string :longitude
      t.bit :picture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
