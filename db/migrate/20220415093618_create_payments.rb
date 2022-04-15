class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.date :date
      t.date :payment_date
      t.string :obs

      t.timestamps
    end
  end
end
