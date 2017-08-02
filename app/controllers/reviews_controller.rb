get "/reviews" do
  @reviews = Review.all

  erb :"/reviews/index"
end

post "/reviews" do
  @review = Review.new(params[:review])

  if @review.save
    redirect "/reviews/#{@review.id}"
  else
    @errors = @review.errors.full_messages
    erb :"/reviews/new"
  end

end

get "/reviews/:id" do
  @review = Review.find(params[:id])

  erb :"/reviews/show"
end

get "/reviews/:id/edit" do
  @review = Review.find(params[:id])

  erb :"/reviews/edit"
end

put "/reviews/:id" do
  @review = Review.find(params[:id])
  @review.update(params[:review])

  redirect "/reviews/#{@review.id}"
end

delete "/reviews/:id" do
  Review.find(params[:id]).destroy

  redirect "/reviews"
end

