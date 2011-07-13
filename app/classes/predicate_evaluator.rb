module PeoplePredicateEvaluator

  # TODO: this could be more general and reusable
  def eval_predicate(identifier, &block)
    result = Set.new
    @people.each do |person|
      unless person.nil?
        # try to find the identifier in the person table then in the postcode table
        value = person[identifier]
        if value.nil? then
          value = postcode(person.postcode_id)[identifier]
        end
        if not value.nil? and yield(value) then # evaluate the predicate
          result << person
        end
      end
    end
    result
   end

  def eval_equals(identifier, value, invert)
    eval_predicate(identifier) { |a|
      result = (a == value)
      if invert then result = (not result) end
      result
    }
  end

  def eval_like(identifier, pattern, invert)
    eval_predicate(identifier) { |a|
      result = (not a.match(pattern).nil?)
      if invert then result = (not result) end
      result
    }
  end
end
