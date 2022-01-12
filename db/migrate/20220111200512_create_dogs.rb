class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :sex
      t.date :dob
      t.string :breed
      t.string :color
      t.string :weight
      t.string :chip
      t.date :vaccines
      t.date :canil
      t.string :allergies
      t.string :obs
      t.string :ownername
      t.string :contact
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :nif
      t.string :email
      t.string :referral

      t.timestamps
    end
  end
end
