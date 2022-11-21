class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.text :address
      t.integer :capacity
      t.boolean :booked
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
