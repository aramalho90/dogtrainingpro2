class CreatePtclasses < ActiveRecord::Migration[6.1]
  def change
    create_table :ptclasses do |t|
      t.numeric :dog_id
      t.date :class_date
      t.string :obs

      t.timestamps
    end
  end
end
