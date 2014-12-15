module Control
  class Loop
    def self.call(root_expression:, input_glyph:, output_glyph:)
      while input = gets.chomp
        new_node = Expression.new(raw_string: input)
        Expression.root ? Expression.root << new_node : new_node.root!
        puts "#{ Expression.root.reduce! }"
      end
    end
  end
end
