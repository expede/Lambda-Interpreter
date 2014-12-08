# coding: utf-8
describe Ast::Reducer do
  describe 'simplifies/reduces the AST' do
    it 'replaces bound variables with argument nodes'
    it 'cleans up substituted abstraction variables (eg `λx`)'
  end
end
