class CreatePttrains < ActiveRecord::Migration[6.1]
  def change
    create_table :pttrains do |t|
      t.date :test1
      t.date :test2
      t.date :test3
      t.date :test4
      t.boolean :inscr_paid
      t.string :status
      t.string :obs

      t.timestamps
    end
  end
end
