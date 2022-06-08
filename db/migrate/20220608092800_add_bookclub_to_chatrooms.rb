class AddBookclubToChatrooms < ActiveRecord::Migration[6.1]
  def change
    add_column :chatrooms, :bookclub, :boolean, default: true
  end
end
