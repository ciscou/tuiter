class CreateTuits < ActiveRecord::Migration
  def self.up
    create_table :tuits do |t|
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :tuits
  end
end
