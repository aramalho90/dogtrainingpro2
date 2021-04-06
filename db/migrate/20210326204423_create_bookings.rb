class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.decimal :price
      t.boolean :paid

      t.timestamps
    end
  end
end
