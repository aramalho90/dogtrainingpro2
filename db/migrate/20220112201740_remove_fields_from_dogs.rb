class RemoveFieldsFromDogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :dogs, :ownername, :string
    remove_column :dogs, :contact, :string
    remove_column :dogs, :address, :string
    remove_column :dogs, :zipcode, :string
    remove_column :dogs, :city, :string
    remove_column :dogs, :nif, :string
    remove_column :dogs, :email, :string
    remove_column :dogs, :referral, :string
  end
end
