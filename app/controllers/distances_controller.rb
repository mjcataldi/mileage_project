get '/distances' do
  @distances = Distance.all

  erb :"/distances/index"
end

post "/distances" do
  @distance = Distance.new

  if @distance.save
    redirect "/distances/#{@distance.id}"
  else
    @errors = @distance.errors.full_messages
    erb :"/distances/new"
  end

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
