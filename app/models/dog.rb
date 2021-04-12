class Dog < ApplicationRecord

has_one_attached :picture
has_many :bookings, dependent: :delete_all

GENDER =
[
['Macho', 'M'],
['Fêmea', 'F']
]

validates :name,  presence: true
validates :sex,  presence: true, length: { :maximum => 1 }

  def formatted_name
  "#{name}, #{ownername}"
  end

end
