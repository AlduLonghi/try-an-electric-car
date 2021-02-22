class AddDescriptionToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :description, :text
  end
end
