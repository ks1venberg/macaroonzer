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
	 validates :msgbody, presence: { message: "- please type the text" }, length: {minimum: 3, message: "- minimum text length is 3 characters"}

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

	@items = parse_orders_input(params[:all_orders])

	return erb :empty_cart if @items.length ==0

	@items.each do |item|
		item[0] = @products.find(item[0])
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


def parse_orders_input all_orders
# example of params[:all_orders]: 'item-id:2,title:Raspberry,amount:1;item-id:1,title:Classic,amount:2;'
arr0 = all_orders.split(/\;/)
	arr2 = []
		arr0.each{|x| arr1 = x.split(/,/); arr2 << [(arr1[0].split(/:/))[1], (arr1[2].split(/:/))[1]]}
			return arr2

end
