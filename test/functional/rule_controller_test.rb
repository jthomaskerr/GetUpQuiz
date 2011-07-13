require 'test_helper'

class RuleControllerTest < ActionController::TestCase
  test "GetUp-posed acceptance tests" do
    test_rule_suite(@@acceptance_tests)
  end
end
