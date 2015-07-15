json.array!(@games) do |game|
  json.extract! game, :id, :name, :sport, :date, :time, :location, :dynamic, :price
  json.url game_url(game, format: :json)
end
