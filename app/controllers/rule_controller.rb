require 'set'
require 'expression_parser'
require 'predicate_evaluator'

class RuleController < ApplicationController
  helper_method :postcode
  helper_method :execute

  include PredicateEvaluator

  def initialize
    @people = Person.Load
    @postcodes = Postcode.Load
    @frm = nil
  end

  def index
    people = @people
    @parser = RuleParser.new
    @interpreter = RuleInterpreter.new.context(:equals_op => method(:eval_equals), :like_op => method(:eval_like))
    @rule = params[:rule]
  end

  def postcode(postcode_id)
    @postcodes[postcode_id.to_i]
  end

  def execute(str)
    begin
      @interpreter.apply(@parser.parse(str))
    rescue Exception => error
      htmlize(error.to_s)
    end
  end

  def htmlize(str)
    str.gsub(/\n/,'<br>')
  end
end

