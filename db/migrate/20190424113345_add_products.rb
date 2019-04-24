class AddProducts < ActiveRecord::Migration[5.2]
	enable_extension "plpgsql"
  def change
  	Product.create(:title => 'Classic macaroon',
	    :description => 'Original reciept, tasty almond cream',
    	:price => 50,
    	:is_bestoffer => false,
    	:pathtoimage => '/images/classic.png')

  	Product.create(:title => 'Raspberry macaroon',
	    :description => 'Full of juicy raspberry jam',
    	:price => 70,
    	:is_bestoffer => false,
    	:pathtoimage => '/images/raspberry.png')
 
  	Product.create(:title => 'Pineapple macaroon',
	    :description => 'Looks shine & gives you fresh senses',
    	:price => 70,
    	:is_bestoffer => false,
    	:pathtoimage => '/images/pineapple.png')

  	Product.create(:title => 'Set of four macaroons',
	    :description => '1 classic, 2 pineapple, 1 raspberry',
    	:price => 270,
    	:is_bestoffer => true,
    	:pathtoimage => '/images/set3.png')

  	Product.create(:title => 'Delicious set of three',
	    :description => '1 strawberry, 1 pineapple, 1 lime&mint',
    	:price => 250,
    	:is_bestoffer => false,
    	:pathtoimage => '/images/set1.png')

  	Product.create(:title => 'Set of four macaroons',
	    :description => '2 classic & 2 pineapple',
    	:price => 230,
    	:is_bestoffer => true,
    	:pathtoimage => '/images/set2.png')

  end
end
