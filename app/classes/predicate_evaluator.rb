module PredicateEvaluator

  def eval_predicate(identifier, &block)
    result = Set.new
    @people.each do |person|
      unless person.nil?
        if yield(person[identifier])
          result << person
        elsif yield(postcode(person.postcode_id)[identifier])
          result << person
        end
      end
    end
    result
   end

  def eval_equals(identifier, value, invert)
    eval_predicate(identifier) { |a|
      if a.nil?
        false
      else
        if invert
          a != value
        else
          a == value
        end
      end
    }
  end

  def eval_like(identifier, pattern, invert)
    eval_predicate(identifier) { |a|
      if a.nil?
        false
      else
        if invert
          a.match(pattern).nil?
        else
          not a.match(pattern).nil?
        end
      end
    }
  end
end
