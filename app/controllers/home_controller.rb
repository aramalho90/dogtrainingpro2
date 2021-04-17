class HomeController < ApplicationController
  def index
      @monthly_total = Booking.find_by_sql("SELECT count(distinct q.id) as num_dogs, sum((q.end_date - q.start_date)) as num_days,sum(q.price) as price FROM
                                              ( SELECT d.id as id, start_date, end_date, case when changed_price is null or changed_price=0 then (price * (end_date - start_date)) else changed_price end as price
                                                   from bookings b join dogs d on b.dog_id = d.id
                                                        where EXTRACT(MONTH from end_date) = EXTRACT(MONTH from NOW())
                                                            and EXTRACT(YEAR from end_date) = EXTRACT(YEAR from NOW()) ) as q")

      @next_bookings = Booking.find_by_sql("SELECT b.id, d.name, d.ownername, d.contact, b.start_date, b.end_date, b.price, (end_date - start_date) as num_nights, (b.price * (end_date - start_date)) as total
                                               from bookings b join dogs d on dog_id = d.id
                                                    where b.start_date > NOW()
                                                        order by start_date, end_date asc
                                                            LIMIT 10")


      @due_bookings = Booking.find_by_sql("SELECT b.id as id, d.name, d.ownername, d.contact, b.start_date, b.end_date, b.price, (end_date - start_date) as num_nights, (b.price * (end_date - start_date)) as total
                                                                                         from bookings b join dogs d on dog_id = d.id
                                                                                              where b.end_date < NOW() and paid=false
                                                                                                  order by start_date, end_date asc
                                                                                                      ")

      @due_vaccines = Dog.find_by_sql("SELECT * from dogs
                                                    where (vaccines is not null and vaccines < NOW())
                                                        or (canil is not null and canil < NOW())
                                                            or (rabies is not null and rabies < NOW())")
  end
end
