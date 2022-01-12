class Owner < ApplicationRecord
has_many :dogs, dependent: :delete_all

validates :name,  presence: true

end
