class TimeStamps < ActiveRecord::Migration
    def change_table 
      add_column(:users, :created_at, :datetime) 
      add_column(:users, :update_at, :datetime)
    end

    def change_table 
      add_column(:posts, :created_at, :datetime) 
      add_column(:posts, :update_at, :datetime)
    end

    def change_table 
      add_column(:comments, :created_at, :datetime) 
      add_column(:comments, :update_at, :datetime)
    end 

end
