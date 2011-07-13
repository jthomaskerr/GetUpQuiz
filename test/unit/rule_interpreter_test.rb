require 'test_helper'
require 'expression_parser'

class RuleInterpreterTest < Test::Unit::TestCase

  include TestHelper
  @@interpreter_unit_tests = YAML.load_file TEST_INTERPRETER_TESTS

  test "interpreter unit  tests" do
    test_rule_suite(@@interpreter_unit_tests)
  end

end