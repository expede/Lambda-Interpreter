# coding: utf-8
describe LambdaInterpreter do
  describe 'external' do
    describe 'input' do
      it 'reads text from the command line'
      it 'reads in text once the `enter` key is pressed'
      it 'provides helpful error messages about malformed input'
    end

    describe 'output' do
      it 'prints the latest reduced lambda expression to the console'
    end
  end

  describe 'internal' do
    describe 'first-pass error checker' do
      it 'errors when parentheses are unbalanced'
      it 'errors when a `λ` or `\` is not followed by a variable'
      it 'errors when multiple `.`s occur without an alphabet letter in between'
    end

    describe 'lexer' do
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
    end

    describe 'AST' do
      describe 'alpha-substitution phase' do
        it 'clarifies scope by rebinding variables'
        it 'detaches free token trees'
      end

      describe 'joining to previous input' do
        context 'existing AST' do
          it 'attaches the newly-parsed AST to the previous tree'
        end

        context 'no prior AST' do
          it 'uses the newly-parsed AST as the first tree node'
        end
      end
    end

    describe 'simplification (beta-reduction)' do
      it 'replaces bound variables with argument nodes'
      it 'cleans up substituted abstraction variables (eg `λx`)'
    end

    describe 'detokenizer' do
      it 'assigns names to remaining variables'
      it 'converts tokens into strings'
    end

    descibe 'temp file functions' do
      it 'saves the completed AST to a temporary file'
      it 'reads previous AST from a temporary file'
      it 'initializes an AST temporary file'
    end
  end
end
