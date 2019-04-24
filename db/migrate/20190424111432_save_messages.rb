class SaveMessages < ActiveRecord::Migration[5.2]
	enable_extension "plpgsql"
  	def change
	  	create_table "messages" do |t|
		    t.text :email
		    t.text :msgbody
				t.timestamps
	  	end
  end
end
