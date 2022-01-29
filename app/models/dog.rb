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

  def owner_name
    owner.try(:name)
  end

  def owner_name=(name)
    self.owner = Owner.find_by_name(name) if name.present?
    raise "Impossível criar cão. Dono inexistente." if self.owner.nil?
  end

end
