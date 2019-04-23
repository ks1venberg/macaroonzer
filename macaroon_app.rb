require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
# require 'bootstrap'

#=============================

class App < Sinatra::Base
end

get '/' do
	erb :index			
end

get '/info' do
	erb :info
end


