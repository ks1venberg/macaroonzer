class CreateProducts < ActiveRecord::Migration[5.2]
	enable_extension "plpgsql"
    def change
    	create_table :products do |t|
    	  	t.string :title
    	  	t.text :description
    	  	t.decimal :price
    	  	t.boolean :is_bestoffer
    	  	t.string :pathtoimage
    			t.timestamps
      end
    end
end
