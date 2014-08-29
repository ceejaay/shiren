require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "postgres://localhost/shiren")


class DungeonRun
  include DataMapper::Resource
  property :id, Serial
  property :dungeon, Text, :required => true
  property :score, Integer, :required => true
  property :complete, Boolean, :required => true, :default => false
  
DataMapper.finalize.auto_upgrade!

end

get "/" do
  @run = DungeonRun.all
  erb :home
end

post "/" do
  DungeonRun.create(params)
  redirect "/"
end

get "/blerg" do
  erb :blerg1
end

post "/blerg" do
  @data = params
  erb :blerg
  
end


