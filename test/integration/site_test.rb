require 'test_helper'

class SiteTest < ActionDispatch::IntegrationTest

  test "execute rules through website"  do
    get "/"
    assert_response :success

    @@acceptance_tests.each do |test|
      get( "/", :rule => test["rule"])
      assert_response :success
      people_count = @response.body.scan('<tr>').count - 1
      assert (people_count == test["expected"].count), "Mismatched Count. Expected #{test["expected"].count} got #{people_count} "
      test["expected"].each do |person|
        assert @response.body.scan("<td>#{person}</td>").count == 1, "Expected result #{person} not found."
      end
    end
  end
end

