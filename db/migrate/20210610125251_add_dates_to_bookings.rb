class AddDatesToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :dates, :string
  end
end
