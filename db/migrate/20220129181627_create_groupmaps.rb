class CreateGroupmaps < ActiveRecord::Migration[6.1]
  def change
    create_table :groupmaps do |t|
      t.string :time
      t.numeric :limit

      t.timestamps
    end
  end
end
