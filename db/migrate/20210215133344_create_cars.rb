class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.integer :horsepower
      t.integer :range
      t.integer :price

      t.timestamps
    end
  end
end
