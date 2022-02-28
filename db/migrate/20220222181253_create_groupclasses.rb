class CreateGroupclasses < ActiveRecord::Migration[6.1]
  def change
    create_table :groupclasses do |t|
      t.numeric :grouptrain_id
      t.date :class_date

      t.timestamps
    end
  end
end
