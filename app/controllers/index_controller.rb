include ERB::Util

get "/" do


  erb :"/index"
end

post "/mileage" do
  # make sure to include ERB::Util for proper url_encoding!
  origin = url_encode(params[:origin])
  destination = url_encode(params[:destination])

  uri = URI.parse("https://maps.googleapis.com/maps/api/distancematrix/json")
  uri.query = "origins=#{origin}"
  uri.query += "&destinations=#{destination}"
  uri.query += "&units=imperial"

  response = Net::HTTP.get(uri)
  value = JSON.parse(response)["rows"][0]["elements"][0]["distance"]["text"]

  @mileage = value

  # if logged_in?
  #   @location = Location.create(
  #       user_id: current_user.id,
  #       origin: params[:origin],
  #       destination: params[:destination],
  #       distance: value.to_f
  #       )

  #   @locations = Location.find_by(user: current_user)
  # end

  erb :"/index"
end
