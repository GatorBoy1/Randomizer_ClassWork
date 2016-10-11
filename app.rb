require 'sinatra'
require_relative 'random_pair.rb'
require_relative 'formatter.rb'

get '/' do
    erb :student_number
end

post '/number' do
    number = params[:student_number]
    redirect '/names?student_number=' + number
end

get '/names' do
    number = params[:student_number]
    erb :get_names, :locals => {:number => number}
end

post '/names' do
    names = params[:user_names]
    random_names_array = randomizer(names)
    name_pairs = fix(random_names_array)
    erb :get_names_again, :locals => {:name_pairs => name_pairs}
end