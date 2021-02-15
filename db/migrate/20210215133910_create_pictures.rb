class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.belongs_to :car, null: false, foreign_key: true
      t.text :image_data

      t.timestamps
    end
  end
end
