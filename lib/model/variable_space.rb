require 'set'

module Model
  class VariableSpace
    POSSIBLE = Set.new(('a'..'z'))

    def self.global
      return Set.new unless Model::Expression.root
      Set.new(Model::Expression.root.to_s.chars).select! do |member|
        member =~ /^[a-z]$/
      end
    end

    def self.safe_random(results: 1)
      global  = self.global
      randoms = Set.new
      results.times do
        result = (POSSIBLE - global).to_a.sample
        fail 'Out of variable space' unless result
        randoms << result
        global  << result
      end
      randoms
    end
  end
end
