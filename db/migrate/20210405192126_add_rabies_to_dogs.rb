class AddRabiesToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :rabies, :date
  end
end
