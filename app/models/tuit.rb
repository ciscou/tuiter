class Tuit < ActiveRecord::Base
  attr_accessible :body

  belongs_to :user

  validates :body, :presence => true, :length => { :maximum => 140 }

  default_scope order("created_at DESC")
end
