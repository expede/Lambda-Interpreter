# coding: utf-8
describe LambdaInterpreter do
  describe 'external' do
    describe 'loop' do
      describe 'input' do
        it 'reads text from the command line'
        it 'reads in text once the `enter` key is pressed'
        it 'provides helpful error messages about malformed input'
      end

      describe 'output' do
        it 'prints the latest reduced lambda expression to the console'
      end

      it 'resets'
    end
  end

  describe 'internal' do
    it 'calls the error checker'
    it 'calls the lexer'
    it 'calls the AST Builder'
    it 'calls the AST beta-reducer'
    it 'detokenizes the reduced AST'
    it 'converts the resulting tree to strings'
    it 'prints the string to the console'
    it 'overwrites the temp file via the TempFileManager'
  end
end
