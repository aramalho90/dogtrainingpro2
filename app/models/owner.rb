class Owner < ApplicationRecord
has_many :dogs, dependent: :destroy

validates :name,  presence: true

  def formatted_name
  "Nome: #{name}, Contacto: #{contact}"
  end

end
