class HomeController < ApplicationController
  def index
      @monthly_total = Booking.find_by_sql("SELECT count(distinct d.id) as num_dogs, sum((end_date - start_date)) as num_days, sum(price * (end_date - start_date)) as price FROM
                                                    bookings b join dogs d on b.dog_id = d.id
                                                        where EXTRACT(MONTH from end_date) = EXTRACT(MONTH from NOW())
                                                            and EXTRACT(YEAR from end_date) = EXTRACT(YEAR from NOW())")

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

      @due_vaccines = Booking.find_by_sql("SELECT * from dogs
                                                    where (vaccines is not null and vaccines < NOW())
                                                        or (canil is not null and canil < NOW())
                                                            or (rabies is not null and rabies < NOW())")
  end
end
