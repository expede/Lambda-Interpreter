# coding: utf-8
describe Sanitizer do
  it 'errors when parentheses are unbalanced'
  it 'errors when a `λ` or `\` is not followed by a letter'
  it 'errors when multiple `.`s occur without an alphabet letter in between'
end
