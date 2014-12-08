# coding: utf-8
describe LambdaInterpreter do
  # :: String
  # -> [[char (uniq)], [[sub-expression]], [[sub-expression]]]
  # -> [sub-expression]

  describe 'I/O loop' do
    describe 'input' do
      it 'reads text from the command line'
      it 'reads in text once the `return` key is pressed'
      it 'provides helpful error messages about malformed input'
    end

    describe 'output' do
      it 'prints the latest reduced lambda expression to the console'
    end
  end
end
