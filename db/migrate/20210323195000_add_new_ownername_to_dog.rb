class AddNewOwnernameToDog < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :ownername, :string
    add_column :dogs, :contact, :string
    add_column :dogs, :address, :string
    add_column :dogs, :zipcode, :string
    add_column :dogs, :city, :string
    add_column :dogs, :nif, :int
    add_column :dogs, :email, :string
    add_column :dogs, :referral, :string
  end
end
