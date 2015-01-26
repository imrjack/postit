class Destroytables < ActiveRecord::Migration
  def change
    drop_table :categories
    drop_table :categories_posts
  end
end
