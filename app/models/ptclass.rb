class Ptclass < ApplicationRecord
belongs_to :dog


  def dog_name
    dog.try(:name)
  end

  def dog_name=(name)
    self.dog = Dog.find_by_name(name) if name.present?
    raise "Impossível criar presença. Cão inexistente." if self.dog.nil?
  end

end
