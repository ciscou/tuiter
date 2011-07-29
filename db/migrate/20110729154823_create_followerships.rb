class CreateFollowerships < ActiveRecord::Migration
  def self.up
    create_table :followerships do |t|
      t.references :user
      t.references :followed

      t.timestamps
    end
  end

  def self.down
    drop_table :followerships
  end
end
