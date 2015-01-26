class CreateUserIdForPosts < ActiveRecord::Migration
  def change
    create_table :user_id_for_posts do |t|
      add_column :posts, :user_id, :integer 
    end
  end
end
