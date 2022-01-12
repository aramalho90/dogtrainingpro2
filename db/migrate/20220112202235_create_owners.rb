class CreateOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :contact
      t.string :address
      t.string :zipcode
      t.string :city
      t.numeric :nif
      t.string :email
      t.string :referral
      t.string :obs

      t.timestamps
    end
  end
end
