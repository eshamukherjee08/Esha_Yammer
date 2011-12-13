class DeleteTableFollower < ActiveRecord::Migration
  def self.up
    drop_table :followers
  end

  def self.down
  end
end
