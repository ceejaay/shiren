require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "postgres://localhost/shiren")


class DungeonRun
  include DataMapper::Resource
  property :id, Serial
  property :dungeon, Text, :required => true
  property :score, Integer, :required => true
  property :complete, Boolean, :required => true, :default => false
  property :level, String, :required => true
  property :experience, Text, :required => true
  property :hitpoints, Text, :required => true
  property :strength, Text, :required => true
  property :gitans, Text, :required => true
  property :sword, Text, :required => true
  property :shield, Text, :required => true
  property :armband, Text, :required => true
  
DataMapper.finalize.auto_upgrade!

end

get "/" do
  @run = DungeonRun.all :order => :score.desc
  erb :home
end

post "/" do
  DungeonRun.create(params)
  redirect "/"
end

get "/:id" do 
  @run = DungeonRun.get params[:id]
  erb :show
end

get "/blerg" do
  erb :blerg1
end

post "/blerg" do
  @data = params
  erb :blerg
end




