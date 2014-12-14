# encoding: utf-8
# A lambda-expression (including recursive sub-expression)
class Expression
  attr_accessor :parameters,
                :body,
                :arguments

  def initialize(ast:)
    @parameters = ast[0]
    @body       = ast[1]
    @arguments  = ast[2]
  end

  def add_argument!(raw:)
    new_argument = Lex.call(raw: raw, next_variable: next_variable)
    @arguments.concat(new_argument)
  end

  def apply!
    @body.map! { |node| (node == @parameters.first) ? @arguments.first : node }

    @arguments.shift
    @parameters.shift
  end

  def reduce!
    apply! until parameters.empty? || arguments.empty?
    body.each { |node| node.reduce! if node.kind_of? Expression }
  end
  
  def to_s
    parameters = "λ{ parameters.join }." unless parameters.empty?
    body       = body.map(&:to_s).join
    arguments  = arguments.map { |arg| "(#{ arg })" }.join
    # Top-level should remove parens
    "(#{ parameters }#{ body } #{ arguments })"
  end

  private
  
  def variables
    argument_vars = @arguments.map(&:variables)
    body_vars = @body.map { |node| node.kind_of?(String) ? node : node.variables }
    
    @parameters.concat(argument_vars).concat(body_vars).flatten.uniq.sort
  end

  def next_variable
    # Only able to handle 'a' to 'Z'
    last = variables.last
    fail 'Out of variable space' if last == 'Z'
    return 'a' unless last
    return 'A' if last == 'z'
    last.next
  end
end
