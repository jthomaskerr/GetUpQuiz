require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  INITIAL_ID          = 0
  INITIAL_POSTCODE_ID = 100
  INITIAL_NAME        = "a".unpack('C*')[0]
  INITIAL_EMAIL       = "a".unpack('C*')[0]

  @@p_13  = Person.new 'id' => 13, 'postcode_id' => 113, 'name' => 'n', 'email' => 'a@n'

  test "load" do
    i = 0
    j = 0
    @@people.each do |p|
       if i < INITIAL_ID
         assert p.nil?,                                           "Unexpected non-nil value returned at @@people[#{i}]"
       else
         assert (not p.nil?),                                     "Unexpected nil value returned at @@people[#{i}]"
         assert p.id          ==  INITIAL_ID           + j,       "Unexpected id found at @@people[#{i}]"
         assert p.postcode_id ==  INITIAL_POSTCODE_ID  + j,       "Unexpected postcode_id found at @@people[#{i}]"
         assert p.name        == (INITIAL_NAME         + j).chr,  "Unexpected name found at @@people[#{i}]"
         assert p.email       == 'a@' + (INITIAL_EMAIL + j).chr,  "Unexpected email found at @@people[#{i}]"
         j += 1
       end
       i += 1
    end
  end

  test "equal?" do
    p_13_  = Person.new 'id' => 13, 'postcode_id' => 113, 'name' => 'n', 'email' => 'a@n'
    i = 0
    assert (not @@p_13.equal? nil),                   "Unexpected equality with nil"
    assert (@@p_13.equal? p_13_),                     "Unexpected inequality of p_13 and p_13_"
    @@people.each do |p|
       if i == @@p_13.id
         assert (p.equal? @@p_13),                    "Unexpected inequality at @@people[#{i}]"
         assert (p.equal? p),                         "Unexpected irreflexitivity at @@people[#{i}]"
         assert (@@p_13.equal? p),                    "Unexpected non-commutativity at @@people[#{i}]"
         assert (p.equal? p_13_),                     "Unexpected intransitivity at @@people[#{i}]"
       else
         assert (not @@p_13.equal? p),                "Unexpected equality between @@p_13 and @@people[#{i}]"
       end
       i += 1
    end
  end

  test "[] operator" do
    assert @@p_13['id']          == @@p_13.id,           "Mismatch between [] operator and accessor for id"
    assert @@p_13['name']        == @@p_13.name,         "Mismatch between [] operator and accessor for name"
    assert @@p_13['postcode_id'] == @@p_13.postcode_id,  "Mismatch between [] operator and accessor for postcode_id"
    assert @@p_13['email']       == @@p_13.email,        "Mismatch between [] operator and accessor for email"
    assert @@p_13['unicorns'].nil?,                      "Unexpected non-nil value for ['unicorns']"
    assert @@p_13['tinkerbell'].nil?,                    "Unexpected non-nil value for ['tinkerbell']"
  end

end