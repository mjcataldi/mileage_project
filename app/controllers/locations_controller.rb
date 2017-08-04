delete "/locations/:id" do
  Location.find(params[:id])

  redirect "/index"
end

