require "sinatra"
require "sinatra/activerecord"
require "./app/models/contact"
require "./app/models/phonenumber"

set :database, "sqlite3:development.sqlite3"

#get '/' do
  #{}"Hello World"
#end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/new' do
  erb :contact_new_form
end

post '/contacts' do
  @contact = Contact.new(name: params[:name])
  if @contact.valid?
     @contact.save
     ####ELSE AGREGAR MENSAJE DE ERROR
  end
  redirect '/contacts'
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :contact_id_edit #, locales { }
end

put '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update(name: params[:name])
  redirect '/contacts'
end

get '/contacts/:id/delete' do
  @contact = Contact.find(params[:id])
  erb :delete_contact
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect '/contacts'
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :user_page
end

get '/contacts/:id/phone_number' do
  @contact = Contact.find(params[:id])
  erb :phonenumber_new
end

post '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @phone_number = @contact.phone_numbers.create(number: params[:phone_number])
  erb :user_page
end






#get '/:contacts_id' do
  #@contacts_id = params["contacts_id"]
  #erb :template
#end
