class Grouptrain < ApplicationRecord
belongs_to :groupmap
belongs_to :dog
has_many :groupclass

STATUS =
[
['Em lista de espera', 'Em lista de espera'],
['A realizar aulas teóricas', 'A realizar aulas teóricas'],
['A decorrer', 'A decorrer'],
['Terminado', 'Terminado']
]

end
