class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.datetime :booking_time
      t.integer :price
      t.text :description
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.timestamps
    end
  end
end
