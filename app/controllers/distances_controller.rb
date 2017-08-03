get '/distances' do
  @distances = Distance.all

  erb :"/distances/index"
end

post "/distances" do

  origin = "138 Abbot Avenue Worthington Ohio"
  destination = "804 Washington Street Evanston IL"

  origin.sub! " ", "%20"
  destination.sub! " ", "%20"

  uri = URI.parse("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{origin}&destinations=#{destination}")
  # response = Net::HTTP.get_print(uri)
  json_object = JSON.parse(response)
  p json_object["rows"]["elements"]["distance"]["text"]

end

get "/distances/new" do
  @distance = Distance.new

  erb :"/distances/new"
end

get "/distances/:id" do
  @distance = Distance.find(params[:id])

  erb :"/distances/show"
end

get "/distances/:id/edit" do
  @distance = Distance.find(params[:id])

  erb :"/distances/edit"
end

put "/distances/:id" do
  @distance = Distance.find(params[:id])

  @distance.update_attributes(params[:distance])

  if @distance.save
    redirect "/distances/#{@distance.id}"
  else
    @errors = @distance.errors.full_messages
    erb :"/distances/edit"
  end

end

delete "/distances/:id" do
  Distance.find(params[:id]).destroy

  redirect "/distances"
end
