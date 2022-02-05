class Pttrain < ApplicationRecord

belongs_to :ptmap
belongs_to :dog

STATUS =
[
['Em lista de espera', 'Em lista de espera'],
['A realizar passagens', 'A realizar passagens'],
['A decorrer', 'A decorrer'],
['Terminado', 'Terminado']
]
end
