class Dog < ApplicationRecord

belongs_to :owner
has_one_attached :picture
has_many :grouptrains, dependent: :delete_all
has_many :pttrains, dependent: :delete_all
has_many :groupclasses, dependent: :delete_all
has_many :ptclasses, dependent: :delete_all
has_many :payments, dependent: :delete_all

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
