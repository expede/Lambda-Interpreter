# -*- coding: utf-8 -*-
module Lex
  class Sanitize
    def self.call(string:)
      balance_parens(string: string)
      balance_lambdas(string: string)
      pure_params(string: string)
    end

    def self.balance_parens(string:)
      balance = 0
      string.chars.each do |char|
        balance += 1 if char == '('
        balance -= 1 if char == ')'
        fail 'found `)` without `(`' if balance < 0
      end
      fail 'unbalanced parens' unless balance.zero? 
    end

    def self.balance_lambdas(string:)
      fail 'unbalanced λ' unless string.scan(/[\\λ]/).count == string.scan(/\./).count
    end

    def self.pure_params(string:)
      string.scan(/[\\λ].+\./).each do |params|
        inner = params[1..-2] # Remove \ and λ
        fail 'non-alpha parameter' unless inner =~ /^[[:alpha:]]+$/
      end
    end
  end
end
