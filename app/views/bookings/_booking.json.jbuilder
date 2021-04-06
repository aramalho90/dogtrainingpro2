json.extract! booking, :id, :start_date, :end_date, :price, :paid, :created_at, :updated_at
json.url booking_url(booking, format: :json)
