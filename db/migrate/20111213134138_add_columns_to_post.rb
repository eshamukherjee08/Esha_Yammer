class AddColumnsToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :post_pic_file_name, :string
    add_column :posts, :post_pic_content_type, :string
    add_column :posts, :post_pic_file_size, :integer
    add_column :posts, :post_pic_updated_at, :datetime
  end

  def self.down
  end
end
