require 'bundler'
Bundler.require

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/rabbits.db")

class Rabbit
  include DataMapper::Resource 
  property :id,           Serial
  property :name,         String, :required => true
  property :description,  Text
  property :age,          Integer
  property :colour,       String
  property :created_at,   DateTime
  property :updated_at,   DateTime
end

get '/rabbits' do
  @rabbits = Rabbit.all
  haml :index
end

get '/rabbits/new' do
  @rabbit = Rabbit.new
  haml :new
end

post '/rabbits' do
  @rabbit = Rabbit.new(params[:rabbit])
  if @rabbit.save
    status 201
    redirect '/rabbits/' + @rabbit.id.to_s
  else
    status 400
    haml :new
  end
end

get '/rabbits/edit/:id' do
  @rabbit = Rabbit.get(params[:id])
  haml :edit
end

put '/rabbits/:id' do
  @rabbit = Rabbit.get(params[:id])
  if @rabbit.update(params[:rabbit])
    status 201
    redirect '/rabbits/' + params[:id]
  else
    status 400
    haml :edit  
  end
end

get '/rabbits/delete/:id' do
  @rabbit = Rabbit.get(params[:id])
  haml :delete
end

 delete '/rabbits/:id' do
  Rabbit.get(params[:id]).destroy
  redirect '/rabbits'  
end

get '/rabbits/:id' do
  @rabbit = Rabbit.get(params[:id])
  haml :show
end

DataMapper.auto_upgrade!