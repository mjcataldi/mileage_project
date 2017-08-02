def add_user_info(user)
  if user.password == params[:password_confirmation]
    if user.save
      session[:user_id] = user.id
      redirect "/users/#{@user.id}"
    else
      @errors = user.errors.full_messages
      erb :"/users/new"
    end
  else
    @errors = ["Oops, your passwords did not match. Try again!"]
    erb :"/users/new"
  end
end


get "/users" do
  @users = User.all

  erb :"/users/index"
end

post "/users" do
  @user = User.new(params[:user])

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

  if @user.password == params[:password_confirmation]
    if @user.update(params[:user])
      redirect "/users/#{@user.id}"
    else
      @errors = @user.errors.full_messages
      erb :"/users/edit"
    end
  else
    @errors = ["Oops, your passwords did not match. Try again!"]
    erb :"/users/edit"
  end
end

delete "/users/:id" do
  User.find(params[:id]).destroy

  redirect "/users"
end

