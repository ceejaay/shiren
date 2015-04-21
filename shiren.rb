require 'sinatra'
require './shiren_model'


get "/dungeons"  do
  data = params[:title]
  @run = DungeonRun.all(:dungeon => data)
  @data = params
  erb :by_dungeon
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
  @data = params
  erb :show
end

get "/user/new" do
  erb :new_user
end

post "/user/new" do
  
end





