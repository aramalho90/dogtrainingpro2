class HomeController < ApplicationController

    def index
        @vacanciesG = Grouptrain.find_by_sql("select m.id, time, \"limit\", count(1) filter (where status in ('A decorrer','A realizar aulas teóricas')) from
            groupmaps m left join grouptrains t
            on m.id = t.groupmap_id
            group by m.id, time, \"limit\"
            order by m.id ")

        @vacanciesP = Pttrain.find_by_sql("select m.id, day, \"limit\", count(1) filter (where status in ('A decorrer','A realizar aulas teóricas')) from
            ptmaps m left join pttrains t
            on m.id = t.ptmap_id
            group by m.id, day, \"limit\"
            order by m.id ")    end
end