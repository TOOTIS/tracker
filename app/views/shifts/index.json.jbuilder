json.array!(@shifts) do |shift|
  json.extract! shift, :id, :day, :desc, :commit, :hours
  json.url shift_url(shift, format: :json)
end
