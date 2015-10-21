json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :user_id, :event_id, :notice, :payment, :paid
  json.url appointment_url(appointment, format: :json)
end
