class AddPricingToVenues < ActiveRecord::Migration[7.0]
  def change
    add_column :venues, :pricing, :decimal
  end
end
