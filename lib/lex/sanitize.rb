# -*- coding: utf-8 -*-
module Lex
  class Sanitize
    def self.call(string:)
      balance_brackets(string: string)
      pure_prams(string: string)
    end

    def self.balance_brackets(string:)
      string.chars.reduce(0) do |memo, char|
        fail 'found `)` without `(`' if memo < 0
        return memo +=1   if char == '('
        return memo += -1 if char == ')'
      end
    end

    def self.pure_params(string:)
      string.scan(/[\\λ].+\./).each do |params|
        inner = params[1..-2] # Remove \ and λ
        fail 'non-alpha parameter' unless inner =~ /^[[:alpha:]]]$/
      end
    end
  end
end
