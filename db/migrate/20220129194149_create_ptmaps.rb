class CreatePtmaps < ActiveRecord::Migration[6.1]
  def change
    create_table :ptmaps do |t|
      t.string :day
      t.numeric :limit

      t.timestamps
    end
  end
end
