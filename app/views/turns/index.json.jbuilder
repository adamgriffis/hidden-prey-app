json.array!(@turns) do |turn|
  json.extract! turn, 
  json.url turn_url(turn, format: :json)
end
