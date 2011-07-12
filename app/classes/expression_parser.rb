require 'parslet'
require 'set'

class RuleParser < Parslet::Parser
  rule(:space?)       { match('\s').repeat }

  rule(:identifier ) { (match('\w') >> match('[\d\w]').repeat).as(:identifier) >> space? }
  rule(:not_equals)  { str('!=')   >> space? }
  rule(:equals)      { str('=')    >> space? }
  rule(:like)        { str('LIKE') >> space? }
  rule(:and_)        { str('AND')  >> space? }
  rule(:or_)         { str('OR')   >> space? }
  rule(:not_)        { str('NOT').maybe  >> space? }
  rule(:l_paren)     { str('(')    >> space? }
  rule(:r_paren)     { str(')')    >> space? }

  rule :string_literal do
      str('"') >>
      (
        (str('\\') >> any) | (str('"').absent? >> any)
      ).repeat.as(:string) >>
      str('"') >> space?
  end

  rule(:int_literal) { match('[0-9]').repeat(1).as(:int) >> space?}
  rule(:literal)     { int_literal | string_literal }

  rule(:equals_pred) { (identifier >> (equals | not_equals).as(:not) >> literal.as(:value)).as(:equals_op) }
  rule(:like_pred)   { (identifier >> not_.as(:not) >> like   >> string_literal.as(:pattern)).as(:like_op) }
  rule(:predicate)   { equals_pred | like_pred }

  #recursively build a generalised expression which is represented by or_expr
  rule(:paren_expr)  { l_paren >> or_expr >> r_paren }
  rule(:primary_expr){ paren_expr | predicate }
  rule(:and_expr)    { (primary_expr.as(:left) >> and_ >> and_expr.as(:right)).as(:and_op) |  primary_expr }
  rule(:or_expr)     { (and_expr.as(:left) >> or_ >> or_expr.as(:right)).as(:or_op) | and_expr }

  rule(:trim)        { space? >> or_expr >> space? }

  # start at the lowest precedence level
  root :trim
end

# context shall be a dictionary of operation symbols mapped to an implementation of the operation.
class RuleInterpreter < Parslet::Transform
  def context(context)
    rule(:string => simple(:string)) { String(string) }
    rule(:int    => simple(:int))    { Integer(int)   }

    rule(:equals_op => { :identifier => simple(:identifier), :not => simple(:not), :value => simple(:value) }) do |bindings|
      context[:equals_op].call(bindings[:identifier].to_s,bindings[:value], invert?(bindings[:not]))
    end

    rule( :like_op => {:identifier => simple(:identifier), :not => simple(:not), :pattern => simple(:pattern) }) do |bindings|
      context[:like_op].call(bindings[:identifier].to_s,bindings[:pattern].to_s, invert?(bindings[:not]))
    end

    rule( :or_op => {:left => subtree(:left), :right => subtree(:right) }) do
      left + right
    end

    rule( :and_op => {:left => subtree(:left), :right => subtree(:right) }) do
       left & right
    end
    self
  end

  private
    def invert?(op_slice)
      true if op_slice.to_s.start_with? '!=', 'NOT'
    end
end
