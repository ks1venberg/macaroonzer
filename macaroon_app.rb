require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#=============================

class App < Sinatra::Base
end

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

class Message < ActiveRecord::Base
end

before do
	@products = Product.all
end

get '/' do
	erb :index			
end

get '/info' do
	erb :info
end


