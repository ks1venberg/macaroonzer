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
	validates :name, presence: { message: "must be given please" }, length: {minimum: 3}
	validates :phone, presence: true, length: { in: 7..13 }
	validates :address, presence: true, length: {minimum: 7}
	
	private
	 def order_params
     params.require(:order).permit(:name, :phone, :address)
  	end
end

class Message < ActiveRecord::Base
	 validates :email, presence: true, length: {minimum: 6}
	 validates :msgbody, presence: true, length: {minimum: 3}
	 
	 private
	 	def message_params
      params.require(:message).permit(:email, :msgbody)
  	end
end

before do
	@products = Product.all
end


get '/' do
	erb :cover, :layout => false
end


get '/main' do
	erb :index			
end

get '/info' do
	erb :info
end

get '/admin' do
	@orders = Order.order ('created_at Desc')
	erb :admin
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

post '/confirm_order' do
		@order = Order.new params[:order]
	  if @order.valid?
	    @order.save
	    @order.errors.clear
	    erb :confirm_order
	  else
	  	return erb :cart
	  end
end

get '/contact' do
	erb :contact
end

post '/contact' do
	@message = Message.new params[:message]
	  if @message.valid?
	    @message.save
	    @message.errors.clear
	    redirect to ('/main')
	  else
	    erb :contact
	  end
end


def parse_orders_input orders_input
	s1 = orders_input.split(/,/)
	arr = []
	s1.each do |x|
		s2 = x.split(/=/)
		s3 = s2[0].split(/_/)

		id = s3[1]
		cnt = s2[1]

		arr2=[id, cnt]
		arr.push arr2
	end
	return arr
end
