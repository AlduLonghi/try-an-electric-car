class AddCategoryToPictures < ActiveRecord::Migration[6.0]
  def change
    add_column :pictures, :category, :string
  end
end
