module Control
  class Loop
    def self.call(root_expression:)
      prints 'Enter a lambda expression expression: '
      while input = gets.chomp
        Lex::Sanitize.call(string: input)
        new_node = Expression.new(raw_string: input)
        Expression.root ? Expression.root << new_node : new_node.root!
        Expression.reduce!
        puts "> #{ Expression.root }"
        print 'Next expression: '
      end
    end
  end
end
