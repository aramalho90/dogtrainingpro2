class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :sex, limit: 1
      t.date :dob
      t.string :breed
      t.string :color
      t.string :weight
      t.string :chip
      t.date :vaccines
      t.date :canil
      t.string :allergies
      t.text :obs

      t.timestamps
    end
  end
end
