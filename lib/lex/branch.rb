module Lex
  class Branch
    attr_accessor :expression,
                  :skipover

    def self.call(raw:)
      Lex::Branch.new(raw: raw).expression
    end

    def initialize(raw:)
      @skipover   = 0
      @expression = []
      build!(raw_array: raw.chars)
    end

    private

    def build!(raw_array:)
      raw_array.each.with_index do |element, index|
        return sprout_branch!(from_index: index) if element == '('
        break unless push!(element: element)
      end
    end

    def sprout_branch!(from_index:)
      node = Lex::Branch.new(raw: @array[from_index..-1])
      @skipover += node.skipover
      @expression.concat ::Expression.new(node.expression)
    end

    def push!(element:)
      @skipover += 1
      return if element == ')'
      @expression << element
    end
  end
end
