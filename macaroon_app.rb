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


post '/cart' do
	
	@orders_input = params[:orders_input]
	@items = parse_orders_input @orders_input

	if @items.length ==0
		return erb :empty_cart
	end
	
	@items.each do |item|
		item[0] = Product.find(item[0])
	end
	
	erb :cart
end


