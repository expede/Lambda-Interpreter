require_relative '../spec_helper'

describe Lex::Sanitize do
  describe '::call' do
    it 'calls ::balance_parens' do
      allow(Lex::Sanitize).to  receive :pure_params
      allow(Lex::Sanitize).to  receive :balance_lambdas
      expect(Lex::Sanitize).to receive :balance_parens
      Lex::Sanitize.call(string: 'abc')
    end

    it 'calls ::pure_params' do
      allow(Lex::Sanitize).to  receive :balance_parens
      allow(Lex::Sanitize).to  receive :balance_lambdas
      expect(Lex::Sanitize).to receive :pure_params
      Lex::Sanitize.call(string: 'abc')
    end

    it 'calls ::balance_lambdas' do
      allow(Lex::Sanitize).to  receive :balance_parens
      allow(Lex::Sanitize).to  receive :pure_params
      expect(Lex::Sanitize).to receive :balance_lambdas
      Lex::Sanitize.call(string: 'abc')
    end
  end

  describe '::balance_brackets' do
    context 'no parens' do
      it 'does not raise an error' do
        expect{ Lex::Sanitize.balance_parens(string: 'abc') }.to_not raise_error
      end
    end

    context 'well formatted' do
      it 'does not raise an error' do
        input = '\ab.c(f(\g.h)i)(j)'
        expect{ Lex::Sanitize.balance_parens(string: input) }.to_not raise_error
      end
    end

    context 'more close parens than open parens' do
      it 'throws an error' do
        expect{ Lex::Sanitize.balance_parens(string: '\ab.(cb))c') }.to raise_error
      end
    end

    context 'more open parens than close parens' do
      it 'throws an error' do
        expect{ Lex::Sanitize.balance_parens(string: '\ab.(cb()c') }.to raise_error
      end
    end

    context 'close paren before open paren' do
      it 'throws an error' do
        expect{ Lex::Sanitize.balance_parens(string: '\ab.)(cb)c') }.to raise_error
      end
    end
  end

  describe '::close_lambdas' do
    context 'unlcosed lambda' do
      it 'raises an error' do
        expect{ Lex::Sanitize.balance_lambdas(string: '\a') }.to raise_error
      end
    end

    context 'too many `.`s' do
      it 'raises an error' do
        expect{ Lex::Sanitize.balance_lambdas(string: '\a.b.') }.to raise_error
      end
    end

    context 'balanced' do
      it 'does not raise an error' do
        expect{ Lex::Sanitize.balance_lambdas(string: '\a.(\b.c(d))(e)') }.to_not raise_error
      end
    end
  end

  describe '::pure_params' do
    context 'non-numeric characters in paremeters' do
      it 'throws an error' do
        expect{ Lex::Sanitize.pure_params(string: '\a2c.d(e)')}.to raise_error
      end
    end

    context 'no paremeters' do
      it 'does not raise an error' do
        expect{ Lex::Sanitize.pure_params(string: 'ab(cd)') }.to_not raise_error
      end
    end

    context 'alphabetc params only' do
      it 'does not raise an error' do
        expect{ Lex::Sanitize.pure_params(string: '\ba.a') }.to_not raise_error
      end
    end
  end
end
