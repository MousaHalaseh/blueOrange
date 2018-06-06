class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email, unique: true
  end
  # so what do I got to do now, this is just sucks! pure and simple
end
