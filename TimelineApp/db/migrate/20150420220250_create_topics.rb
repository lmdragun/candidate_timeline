class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
    	t.string :name
      t.string :wiki_url
    end
  end
end
