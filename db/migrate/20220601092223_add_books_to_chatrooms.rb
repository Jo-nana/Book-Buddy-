class AddBooksToChatrooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :book, foreign_key: true
  end
end
