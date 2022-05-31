class AddTagsToBook < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :tags, :string
    add_column :books, :tags, :string, array: true, default: []
  end
end
