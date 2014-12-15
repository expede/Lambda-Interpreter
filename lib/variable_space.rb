require 'set'

class VariableSpace
  POSSIBLE = Set.new(('a'..'z'))

  def self.gobal
    return Set.new unless ::Expression.root
    Set.new(::Expression.root.to_s.chars).select! do |member|
      member =~ /^[[:alpha:]]$/
    end
  end
  
  def self.safe_random(results: 1)
    global = self.global
    results.reduce(Set.new) do |memo, _|
      result = (POSSIBLE - global).to_a.sample
      fail 'Out of variable space' unless result
      memo   << result
      global << result
    end
  end
end
