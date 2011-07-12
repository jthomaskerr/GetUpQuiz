require 'rubygems'
gem 'test-unit'

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'active_record/fixtures'


TEST_ROOT = "#{File.dirname(__FILE__)}" unless defined?(TEST_ROOT)

TEST_PEOPLE    = TEST_ROOT + "/fixtures/people.csv"
TEST_POSTCODES = TEST_ROOT + "/fixtures/postcodes.csv"

class ActiveSupport::TestCase
  protected
    @@people    = Person.load   TEST_PEOPLE
    @@postcodes = Postcode.load TEST_POSTCODES
end
