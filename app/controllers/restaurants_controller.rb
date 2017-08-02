get "/restaurants" do
  @restaurants = Restaurant.all

  erb :"/restaurants/index"
end

post "/restaurants" do
  @restaurant = Restaurant.new(params[:restaurant])

  if @restaurant.save
    redirect "/restaurants/#{@restaurant.id}"
  else
    @errors = @restaurant.errors.full_messages
    erb :"/restaurants/new"
  end

end

get "/restaurants/new" do
  @restaurant = Restaurant.new

  erb :"/restaurants/new"
end

get "/restaurants/:id" do
  @restaurant = Restaurant.find(params[:id])

  erb :"/restaurants/show"
end

get "/restaurants/:id/edit" do
  @restaurant = Restaurant.find(params[:id])

  erb :"/restaurants/edit"
end

put "/restaurants/:id" do
  @restaurant = Restaurant.find(params[:id])
  @restaurant.update(params[:restaurant])

  redirect "/restaurants/#{@restaurant.id}"
end

delete "/restaurants/:id" do
  Restaurant.find(params[:id]).destroy

  redirect "/restaurants"
end

