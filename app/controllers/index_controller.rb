get "/" do


  erb :"/index"
end

post "/mileage" do
  origin = params[:origin].gsub! " ", "%20"
  destination = params[:destination].gsub! " ", "%20"

  uri = URI.parse("https://maps.googleapis.com/maps/api/distancematrix/json")
  uri.query = "origins=#{origin}"
  uri.query += "&destinations=#{destination}"
  uri.query += "&units=imperial"

  logger.info(uri)

  response = Net::HTTP.get(uri)
  value = JSON.parse(response)["rows"][0]["elements"][0]["distance"]["text"]

  @mileage = value
  erb :"/index"
end
