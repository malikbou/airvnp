class ChangeEndDateToBeDatetimeInBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :end_date, :datetime
  end
end
