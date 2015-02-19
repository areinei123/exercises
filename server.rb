require "sinatra"
require "pry"

get "/" do
  ingredient = File.readlines("ingredients.txt")
  erb :index, locals: { ingredient: ingredient }
end

post "/ingredients" do
  ingredient = params["ingredients"]

  File.open("ingredients.txt", "a") do |file|
    file.puts(ingredient)
  end

  redirect "/"
end
