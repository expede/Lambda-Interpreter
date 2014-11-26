describe Lexer do
  describe 'first-pass input sanitizer' do
    it 'removes unnessisarily doubled parentheses pairs'
  end

  describe 'function' do
    describe 'boundaries' do
      it 'may have no boundary'
      it 'may be bounded by one or more spaces'
      it 'may be bounded by one or more parentheses (pairs)'
    end

    describe 'abstraction variables' do
      describe 'boundaries' do
        it 'may be right-bounded by a single `.`'
        it 'may be right-bounded by one or more spaces'
        it 'may be right-bounded by one or more parentheses'
        it 'throws an error, otherwise'
      end
    end

    describe 'bound variables' do
      describe 'boundaries' do
        it 'may be left-bounded by a `.`'
        it 'may be either-bounded parentheses'
      end
    end
  end

  describe 'arguments' do
    describe 'boundaries' do
      context 'whitespace' do
        it 'may be bounded by one or more spaces'
        it 'may be bounded by one or more tabs'
      end

      context 'parentheses' do
        it 'may be bounded by by one or more pairs of parentheses'
        it 'throws an error when a parenthesis in unbalanced'
      end
    end
  end

  describe 'tokens' do
    it 'represents bound variables'
    it 'respresents free variables'
    it 'represents subexpressions'
    its 'subexpressions contain zero or more tokens'
  end
end
