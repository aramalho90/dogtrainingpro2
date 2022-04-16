class HomeController < ApplicationController

    def index
        @vacanciesG = Grouptrain.find_by_sql("select m.id, time, \"limit\", count(1) filter (where status in ('A decorrer','A realizar aulas teóricas')) from
            groupmaps m left join grouptrains t
            on m.id = t.groupmap_id
            group by m.id, time, \"limit\"
            order by m.id ")

        @vacanciesP = Pttrain.find_by_sql("select m.id, day, \"limit\", count(1) filter (where status in ('A decorrer','A realizar passagens')) from
            ptmaps m left join pttrains t
            on m.id = t.ptmap_id
            group by m.id, day, \"limit\"
            order by m.id ")

        @missing_payments = Owner.paginate_by_sql("
        select o.id as owner_id,o.name, o.contact,d.id as dog_id,  d.name as dog_name,tr.status, case when inscr_paid=false then 'Inscrição' else 'Teóricas' end as missing from
        owners o join dogs d
        on o.id = d.owner_id
        	 join (
        			select dog_id,inscr_date, status, inscr_paid, teoric_paid
        			from grouptrains union
        			select dog_id,inscr_date, status, inscr_paid, true as teoric_paid from pttrains
        	) as tr
        on d.id = tr.dog_id
        where status in ('A realizar passagens','A decorrer','A realizar aulas teóricas')
        and inscr_paid = false or teoric_paid=false

        union

        select o.id as owner_id,o.name, o.contact,d.id as dog_id, d.name as dog_name,tr.status, 'Aulas' as missing
        from dogs d
        	 join (
        			select dog_id,inscr_date, status
        			from grouptrains union
        			select dog_id,inscr_date, status from pttrains
        	) as tr
        on d.id = tr.dog_id
        join owners o on o.id = d.owner_id
        left join payments pay on d.id = pay.dog_id and pay.date between cast(date_trunc('month',inscr_date) as date) and cast(date_trunc('month', current_date) as date)
        where status in ('A realizar passagens','A decorrer','A realizar aulas teóricas') and inscr_date is not null
        group by o.id,o.name, o.contact,d.id, d.name,tr.status,extract(month from age(cast(date_trunc('month', current_date) as date), cast(date_trunc('month',inscr_date) as date)))
        having count(1) filter (where pay.date is not null) < extract(month from age(cast(date_trunc('month', current_date) as date), cast(date_trunc('month',inscr_date) as date)))
        ", :page => params[:missing_page], :per_page => 15)

        @waiting = Owner.paginate_by_sql(
        "select o.id as owner_id,o.name, o.contact,d.id as dog_id, d.name as dog_name,tr.train
        from dogs d
        join (
                select dog_id,inscr_date,status, 'Grupo' as train
                from grouptrains union
                select dog_id,inscr_date,status, 'PT' as train from pttrains
                ) as tr
                on d.id = tr.dog_id
                join owners o on o.id = d.owner_id
                where status = 'Em lista de espera'", :page => params[:waiting_page], :per_page => 10)

        end
end