class CreateCommemtsOnPosts < ActiveRecord::Migration[5.2]
  def change
  	create_table :comments do |t|
  		t.text :name
  		t.text :text
  		t.integer :post_id

  		t.timestamps
  	end
  end
end
