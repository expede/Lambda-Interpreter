# Read in strings, output a plain AST (as array)
class Lex
  def self.call(raw:, ast:, next_variable: 'a')
    rough      = raw.split('.', 2) #replace with regex for between \ and .
    parameters = rough[0].chars
    body       = Lex.subexpression(raw_array: rough[1].chars)
    arguments  = 'a'
    [parameters, body, arguments]
  end

  def self.subexpression(raw_array:)
    raw_array[1..-1].each.with_index do |element, index|
      skipover += 1
    end
    [skipover, memo]
  end
end
