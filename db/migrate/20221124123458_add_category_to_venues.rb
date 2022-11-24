class AddCategoryToVenues < ActiveRecord::Migration[7.0]
  def change
    add_column :venues, :category, :string
  end
end
