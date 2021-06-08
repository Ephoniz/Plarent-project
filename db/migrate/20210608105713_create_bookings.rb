class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :planet, null: false, foreign_key: true
      t.date :date_start
      t.date :date_end
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
