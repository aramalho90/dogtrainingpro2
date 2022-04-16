class Dog < ApplicationRecord

belongs_to :owner
has_one_attached :picture
has_many :grouptrains, dependent: :destroy
has_many :pttrains, dependent: :destroy
has_many :groupclasses, dependent: :destroy
has_many :ptclasses, dependent: :destroy
has_many :payments, dependent: :destroy

  validates_length_of :grouptrains, maximum: 1
  validates_length_of :pttrains, maximum: 1

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
