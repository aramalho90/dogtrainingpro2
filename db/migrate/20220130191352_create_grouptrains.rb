class CreateGrouptrains < ActiveRecord::Migration[6.1]
  def change
    create_table :grouptrains do |t|
      t.date :teoric1
      t.date :teoric2
      t.boolean :inscr_paid
      t.boolean :teoric_paid
      t.string :status

      t.timestamps
    end
  end
end
