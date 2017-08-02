get "/users" do
  @users = User.all

  erb :"/users/index"
end

post "/users" do
  @user.update_attributes(params[:user])

  if @user.password == params[:password_confirmation]
    if @user.save
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @errors = @user.errors.full_messages
      erb :"/users/new"
    end
  else
    @errors = ["Oops, your passwords did not match. Try again!"]
    erb :"/users/new"
  end

end

get "/users/new" do
  @user = User.new

  erb :"/users/new"
end

get "/users/:id" do
  @user = User.find(params[:id])

  erb :"/users/show"
end

get "/users/:id/edit" do
  @user = User.find(params[:id])

  erb :"/users/edit"
end

put "/users/:id" do
  @user = User.find(params[:id])
  @user.update(params[:user])

  redirect "/users/edit"
end

delete "/users/:id" do
  User.find(params[:id]).destroy

  redirect "/users"
end

