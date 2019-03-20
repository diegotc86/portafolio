require "sinatra"
require "erb"
require 'json'
require 'sinatra/reloader'

def read_data(file)
  JSON.parse(File.read(file))
end

def write_data(filename, data)
  File.open(filename, "w") do |file|
    file.puts(data.to_json)
  end
end

def convert(data)
  size = data.values[0].length
  @new = Array.new(size, {})
  data.each do |key,value|
    value.each_with_index do |val, index|
      @new[index] = @new[index].merge({key => val})
    end
  end
  @new
end

#----------------------------------------
get "/" do
  @data = read_data("about.json")
  erb :about, {:layout => :layout }
end

get "/edit" do
  @data = read_data("about.json")
  erb :about_edit, {:layout => :layout }
end

post "/" do
  write_data("about.json", params)
  redirect '/'
end

#----------------------------------------
get "/experience" do
  @data = read_data("experience.json")
  erb :experience, {:layout => :layout }
end

get "/experience_edit" do
  @data = read_data("experience.json")
  erb :experience_edit, {:layout => :layout }
end

post "/experience" do
  write_data("experience.json", convert(params))
  redirect '/experience'
end

#----------------------------------------
get "/education" do
  erb :education, {:layout => :layout }
end

#----------------------------------------
get "/skills" do
  erb :skills, {:layout => :layout }
end

#----------------------------------------
get "/interests" do
  erb :interests, {:layout => :layout }
end

#----------------------------------------
get "/awards" do
  erb :awards, {:layout => :layout }
end