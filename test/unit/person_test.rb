require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  test "validate data" do
    i = 0
    @@people.each do |p|
       assert p.id          = i,                   "Unexpected id found"
       assert p.name        = (?a + i).chr,        "Unexpected name found"
       assert p.postcode_id = 100 + i,             "Unexpected postcode_id found"
       assert p.email       = 'a@' + (?a + i).chr, "Unexpected email found"
       i += 1
    end
  end
end