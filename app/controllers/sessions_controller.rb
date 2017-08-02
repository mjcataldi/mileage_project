get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(username: params[:username])

  if @user
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @errors = ["Oops, your password didn't work.  Try again."]
      erb :'/sessions/new'
    end
  else
    @errors = ["That username is not registered.  Try again or click the register link."]
    erb :"/sessions/new"
  end
end

get '/sessions/:id' do
  session[:user_id] = nil
  # sessions.delete(:user_id)
  redirect '/'
end
