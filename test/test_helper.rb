require 'rubygems'
gem 'test-unit'

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'


TEST_ROOT              = "#{File.dirname(__FILE__)}" unless defined?(TEST_ROOT)
FIXTURES_ROOT          = TEST_ROOT     + "/fixtures"
TEST_PEOPLE            = FIXTURES_ROOT + "/people.csv"
TEST_POSTCODES         = FIXTURES_ROOT + "/postcodes.csv"
TEST_ACCEPTANCE_TESTS  = FIXTURES_ROOT + "/acceptance_tests.yml"
TEST_INTERPRETER_TESTS = FIXTURES_ROOT + "/interpreter_unit_tests.yml"

module TestHelper
  def comparison_str(test,people)
    "Expected #{test["expected"].count} (#{test["expected"]}), found #{people.count} (#{people}. test was '#{test["description"]}')"
  end

  def test_rule_suite(test_cases)
    controller = RuleController.new
    for test in test_cases do
      results = controller.execute(test["rule"])
      assert results.respond_to? :count,               "Unexpected parse error: #{results}"

      assert results.count == test["expected"].count, "Mismatched count. " + comparison_str(test,results)
      for person in results do
        assert test["expected"].find(person.name), "#{person.name} unexpected. " + comparison_str(test,results)
      end
    end
  end
end

class ActiveSupport::TestCase
  protected
    @@people                 = Person.load    TEST_PEOPLE
    @@postcodes              = Postcode.load  TEST_POSTCODES
    @@acceptance_tests       = YAML.load_file TEST_ACCEPTANCE_TESTS

    include TestHelper
end
