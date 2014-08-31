require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "postgres://localhost/shiren")


class DungeonRun
  include DataMapper::Resource
  property :id, Serial
  property :created_at, DateTime
  property :user, Text 
  property :dungeon, Text, :required => true
  property :score, Integer, :required => true
  property :killed_by, Text 
  property :complete, Boolean, :required => true, :default => false
  property :level, Text, :required => true
  property :experience, Text, :required => true
  property :hitpoints, Text, :required => true
  property :strength, Text, :required => true
  property :gitans, Text, :required => true
  property :sword, Text, :required => true
  property :shield, Text, :required => true
  property :armband, Text, :required => true
  property :approved, Boolean, :default => false


end
DataMapper.finalize.auto_upgrade!

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

get "/user/new" do
  erb :new_user
end

post "/user/new" do
  
end




