class Tuit < ActiveRecord::Base
  attr_accessible :body

  belongs_to :user

  validates :body, :presence => true, :length => { :maximum => 140 }

  default_scope order("created_at DESC")
  scope :after, lambda { |t| where("created_at > ?", Time.at(t.to_i + 1)) if t }
end
