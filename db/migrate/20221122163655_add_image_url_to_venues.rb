class AddImageUrlToVenues < ActiveRecord::Migration[7.0]
  def change
    add_column :venues, :image_url, :string
  end
end
