class Dog < ApplicationRecord

belongs_to :owner

GENDER =
[
['Macho', 'M'],
['Fêmea', 'F']
]
validates :dog, :presence => true
validates :name,  presence: true
validates :sex,  presence: true, length: { :maximum => 1 }

  def formatted_name
  "#{name}, #{ownername}"
  end


end
