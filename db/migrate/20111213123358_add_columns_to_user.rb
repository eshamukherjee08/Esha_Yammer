class AddColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :avatar_file_name, :string
    add_column :users, :avatar_content_type, :string
    add_column :users, :avatar_file_size, :integer
    add_column :users, :avatar_updated_at, :datetime
    add_column :users, :name, :string
  end

  def self.down
  end
end
