class CreateTableFollower < ActiveRecord::Migration
  def self.up
    create_table :followers, :id => false do |t|
      t.integer :follower_id
      t.integer :followee_id
    end
  end

  def self.down
  end
end
