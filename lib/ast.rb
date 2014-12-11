# Main class; frames computation
class Ast
  attr_accessor :model

  def initialize(input_string)
    @model = Lex.call(raw: input_string)
  end

  def to_s
    # Ast::Present.call(@model)
    "#{ fun_vars_to_s }#{ fun_struct_to_s }#{ args_to_s }"
  end

  def reduce!
    @model = Ast::BetaReducer.call()
  end

  private

  def fun_vars_to_s
    vars = @model[0].reduce { |memo, v| memo.concat(v) }
    "\#{ vars }."
  end

  def fun_sructure_to_s
    
  end

  def args_to_s
    
  end
end
