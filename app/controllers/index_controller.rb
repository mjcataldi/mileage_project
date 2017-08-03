get "/" do


  erb :"/index"
end

post "/mileage" do

  origin = params[:origin].gsub! " ", "%20"
  destination = params[:destination].gsub! " ", "%20"

  uri = URI.parse("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{origin}&destinations=#{destination}")
  value = JSON.parse(Net::HTTP.get(uri))["rows"][0]["elements"][0]["distance"]["text"]

  @mileage = value
  erb :"/index"
end
