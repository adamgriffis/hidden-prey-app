json.array!(@moves) do |move|
  json.extract! move, 
  json.url move_url(move, format: :json)
end
