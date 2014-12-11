describe Lex::Target do
  describe 'structures the tokens' do
    it 'is a kind of array'
    it 'starts as an empty array'
    it 'contains exactly 3 arrays'

    describe 'variable array' do
      it 'is in the first position'
      it 'contains an ordered list of tokens'
      its 'tokens are unique'
      it 'may not contain sub-arrays'
    end

    describe 'position array' do
      it 'is in the second position'
      it 'contains an ordered list of tokens'
      it 'may contain sub-arays'
    end

    describe 'argument array' do
      it 'is in the last position'
      it 'contains and ordered list of tokens'
      it 'may contain sub-arrays'
    end
  end

  it 'uses the alpha-substituter to clarify scope'

  describe 'joining to previous input' do
    context 'existing AST' do
      it 'attaches the newly-parsed AST to the previous tree'
    end

    context 'no prior AST' do
      it 'uses the newly-parsed AST as the first tree node'
    end
  end
end
