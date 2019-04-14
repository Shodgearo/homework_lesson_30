class Createtableposts < ActiveRecord::Migration[5.2]
  def change
  	create_table :posts do |t|
  		t.text :name
  		t.text :text
  		t.text :comment

  		t.timestamps
  	end
  end
end
