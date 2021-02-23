class AddColumnToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :city, :string
  end
end
