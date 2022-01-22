class Dog < ApplicationRecord

belongs_to :owner
has_one_attached :picture

GENDER =
[
['Macho', 'M'],
['Fêmea', 'F']
]
validates :owner, :presence => true
validates :name,  presence: true
validates :sex,  presence: true, length: { :maximum => 1 }

end
