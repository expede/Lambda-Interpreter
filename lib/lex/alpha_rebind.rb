require 'set'

module Lex
  class AlphaRebind
    def self.call(string:)
      collisions = VariableSpace.set & string.chars.to_set
      new_vars   = VariableSpace.safe_random(results: collisions.size)
      collisions.each { |var| string.replace!(var, new_vars.first.delete) }
      string
    end
  end
end
