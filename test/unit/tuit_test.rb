require 'test_helper'

class TuitTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Tuit.new.valid?
  end
end
