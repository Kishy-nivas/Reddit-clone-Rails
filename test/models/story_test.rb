require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  
  def test_is_not_valid_without_a_name 
    s= Story.create(name: 
      nil, link: "www.facebook.com");
    assert s.errors[:name].any? 
    refute s.valid? 
  end

end
