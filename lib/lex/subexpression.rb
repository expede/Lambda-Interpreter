module Lex
  class Branch
    attr_accessor :expression,
                  :skipover

    def initialize(raw_array:)
      fail unless raw_array[0] == '(' && raw_array[-1] == ')'
      @raw_array  = raw_array[1..-1]
      @skipover   = 2
      @expression = []
      grow!
    end

    private
    
    def grow!
      @raw_array.each.with_index do |element, index|
        return sprout_branch!(from_index: index) if element == '('
        break unless push!(element: element)
      end
    end

    def sprout_branch!(from_index:)
      node = Lex::Branch.new(raw_array: @array[from_index..-1])
      @skipover += node.skipover
      @expression.concat Expression.new(node.expression)
    end

    def push!(element:)
      @skipover += 1
      return if element == ')'
      @expression << element
    end
  end
end
