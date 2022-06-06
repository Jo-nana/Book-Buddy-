class AddTagsToUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :tags, :string
    add_column :users, :tags, :string, array: true, default: []
  end
end
