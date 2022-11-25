class ChangePricingInVenues < ActiveRecord::Migration[7.0]
  def change
    change_column :venues, :pricing, :integer
  end
end
