class AddUserIdToTuits < ActiveRecord::Migration
  def self.up
    add_column :tuits, :user_id, :integer
    add_index  :tuits, :user_id
  end

  def self.down
    remove_index  :tuits, :user_id
    remove_column :tuits, :user_id
  end
end
