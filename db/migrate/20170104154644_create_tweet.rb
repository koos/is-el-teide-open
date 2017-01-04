class CreateTweet < ActiveRecord::Migration[5.0]
  def up
  	create_table :tweets do |t|
  		t.string :origin_id
  		t.string :text
  		t.datetime :published_at
  	end
  end

  def down
  	drop_table :tweets
  end
end
