require "sinatra"
require "erb"
require 'sinatra/reloader'

get "/" do
  erb :about, {:layout => :layout }
end

get "/experience" do
  erb :experience, {:layout => :layout }
end

get "/education" do
  erb :education, {:layout => :layout }
end

get "/skills" do
  erb :skills, {:layout => :layout }
end

get "/interests" do
  erb :interests, {:layout => :layout }
end

get "/awards" do
  erb :awards, {:layout => :layout }
end