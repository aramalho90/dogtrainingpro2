class Dog < ApplicationRecord

has_one_attached :picture

GENDER =
[
['Macho', 'M'],
['Fêmea', 'F']
]

validates :name,  presence: true
validates :sex,  presence: true, length: { :maximum => 1 }
end
