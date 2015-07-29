class AddPaperclipToItems < ActiveRecord::Migration
  def change
    add_column :items, :picture_file_name, :string
    add_column :items, :picture_content_type, :string
    add_column :items, :picture_file_size, :integer
    add_column :items, :picture_updated_at, :datetime
  end
end
