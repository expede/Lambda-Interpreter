describe Lex::Scan::Structure do
  # Generates a model of split strings
  #
  # EXAMPLE:
  # ========
  #
  # structured = Lex::Scan::Structure.new(string)
  # structured.ast
  # => [[function_variables::String, function_body::String], [arguments::String]] 
  #
  # structured.abstraction.variables
  # => '\abcdef'
  #
  # structured.abstraction.body
  # => 'faebc'
  #
  # structured.arguments
  # => ['\x.x', '\xy.y', 'abc']
  describe 'structural boundaries' do
    describe 'function' do
      it 'may have no boundary'
      it 'may be bounded by one or more spaces'
      it 'may be bounded by one or more parentheses (pairs)'

      describe 'ordered abstraction variables' do
        it 'may be right-bounded by a single `.`'
        it 'may be right-bounded by one or more spaces'
        it 'may be right-bounded by one or more parentheses'
      end

      describe 'abstraction body' do
        it 'may be left-bounded by a `.`'
        it 'may be either-bounded parentheses'
      end
    end

    describe 'arguments' do
      it 'may be bounded by one or more spaces'
      it 'may be bounded by one or more parentheses (pairs)'

      describe 'single argument' do
        context 'whitespace' do
          it 'may be bounded by one or more spaces'
          it 'may be bounded by one or more tabs'
        end

        context 'parentheses' do
          it 'may be bounded by by one or more pairs of parentheses'
        end
      end
    end
  end

  describe 'subtree' do
    it 'must be bounded by parentheses (pairs)'
  end
end
