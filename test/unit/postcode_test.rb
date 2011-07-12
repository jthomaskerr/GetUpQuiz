require 'test_helper'

class PostcodeTest  < ActiveSupport::TestCase
  INITIAL_ID       = 100
  INITIAL_POSTCODE = 2000
  INITIAL_SUBURB   = "a".unpack('C*')[0]

  @@p_13  = Postcode.new 'id' => 113, 'number' => 2013, 'suburb' => 'n'

  test "load" do
    i = 0
    j = 0
    @@postcodes.each do |p|
       if i < INITIAL_ID
         assert p.nil?,                                "Unexpected non-nil value returned at @@postcodes[#{i}]"
       else
         assert (not p.nil?),                          "Unexpected nil value returned at @@postcodes[#{i}]"
         assert p.id     ==  INITIAL_ID       + j,     "Unexpected id found at @@postcodes[#{i}]"
         assert p.number ==  INITIAL_POSTCODE + j,     "Unexpected number found at @@postcodes[#{i}]"
         assert p.suburb == (INITIAL_SUBURB   + j).chr,"Unexpected suburb found at @@postcodes[#{i}]"
         j += 1
       end
       i += 1
    end
  end

  test "equal?" do
    p_13_  = Postcode.new 'id' => 113, 'number' => 2013, 'suburb' => 'n'
    i = 0
    assert (not @@p_13.equal? nil),                   "Unexpected equality with nil"
    assert (@@p_13.equal? p_13_),                     "Unexpected inequality of p_13 and p_13_"
    @@postcodes.each do |p|
       if i == @@p_13.id
         assert (p.equal? @@p_13),                    "Unexpected inequality at @@postcodes[#{i}]"
         assert (p.equal? p),                         "Unexpected irreflexitivity at @@postcodes[#{i}]"
         assert (@@p_13.equal? p),                    "Unexpected non-commutativity at @@postcodes[#{i}]"
         assert (p.equal? p_13_),                     "Unexpected intransitivity at @@postcodes[#{i}]"
       else
         assert (not @@p_13.equal? p),                "Unexpected equality between @@p_13 and @@postcodes[#{i}]"
       end
       i += 1
    end
  end

  test "[] operator" do
    assert @@p_13['id']       == @@p_13.id,           "Mismatch between [] operator and accessor for id"
    assert @@p_13['number']   == @@p_13.number,       "Mismatch between [] operator and accessor for number"
    assert @@p_13['postcode'] == @@p_13.number,       "Mismatch between [] operator and accessor for postcode"
    assert @@p_13['suburb']   == @@p_13.suburb,       "Mismatch between [] operator and accessor for suburb"
    assert @@p_13['unicorns'].nil?,                   "Unexpected non-nil value for ['unicorns']"
    assert @@p_13['tinkerbell'].nil?,                 "Unexpected non-nil value for ['tinkerbell']"
  end

end