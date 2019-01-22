require "sinatra"
require "erb"

get '/' do
  "Hello World"
end

get '/contacts' do
  @contacts = params["contacts"]
  erb :template
end

get '/:contacts_id' do
  @contacts_id = params["contacts_id"]
  erb :template 
end
