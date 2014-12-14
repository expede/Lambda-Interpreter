# encoding: utf-8
# Main class; frames program
# Reads in string and presents output
class Expression
  attr_accessor :ast

  def initialize(string:)
    @ast = Lex.call(raw: string)
  end

  def parameters
    @ast[0]
  end

  def body
    @ast[1]
  end

  def arguments
    @ast[2]
  end
  
  def to_s
    "(#{ parameters_to_s }#{ body_to_s })#{ arguments_to_s }"
  end

  def apply!
      parameters.each do |param|
        break unless arguments.first
        body_indices = body.each_index.select { |i| body[i] == param }
        body_indices.each { |body_index| body[body_index] = args[index] }
        arguments.shift
      end
  end
  
  def reduce!
    @ast = Expression::BetaReducer.call(@ast)
  end

  private
  
  def parameters_to_s
    return if parameters.empty?
    
    param_string =  @parameters.reduce { |memo, param| memo.concat param.to_s }
    "λ{ param_string }."
  end

  def body_to_s
    return if body.empty?
    @body.reduce { |memo, node| memo.concat node.to_s }
  end    

  def arguments_to_s
    return if arguments.empty?
    @arguments.reduce { |memo, arg| memo.concat "(#{ arg })" }
  end
end
