describe Lex do
  it 'removes unnessisarily doubled parentheses pairs'
  it 'splits input into abstraction, bound, and argument sections'

  describe 'converts text to tokens' do
    it 'tokenizes bound variables'
    it 'tokenizes free variables'

    describe 'subexpressions' do
      it 'tokenizes subexpressions'
      its 'subexpressions contain zero or more tokens'
    end
  end
end
