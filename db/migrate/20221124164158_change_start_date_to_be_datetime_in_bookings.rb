class ChangeStartDateToBeDatetimeInBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :start_date, :datetime
  end
end
