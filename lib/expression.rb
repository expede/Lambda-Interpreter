# encoding: utf-8
# Main class; frames program
# Reads in string and presents output
class Expression
  attr_accessor :parameters,
                :body,
                :arguments

  def initialize(raw:)
    ast = Lex.call(raw: raw)
    @parameters = ast[0]
    @body       = ast[1]
    @arguments  = ast[2]
  end
  
  def add_argument!(raw:)
    new_argument = Lex.call(raw: raw, taken_variables: variables)
    @arguments << new_argument
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

  def variables
    argument_vars = @arguments.map(&:variables)
    body_vars = @body.map { |node| node.kind_of?(String) ? node : node.variables }
    
    @parameters.concat(argument_vars).concat(body_vars).flatten.uniq
  end
end
