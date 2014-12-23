# encoding: utf-8
require_relative './lex/branch'

# A lambda-expression (including recursive sub-expression)
class Expression
  attr_accessor :parameters,
                :body,
                :arguments

  def self.root
    @@root
  end

  def self.reduce!
    fail 'No root' unless @@root
    @@root.reduce!
  end

  def initialize(raw_string:)
    param_end = raw_string.index('.') if raw_string[0] =~ /[\\λ]/
    rest = Lex::Branch.call(raw: raw_string[(param_end ? (param_end + 1) : 0)..-1])
    space_index = rest.index(' ')

    @parameters = param_end ? raw_string[1..(param_end - 1)] : []
    @body       = (space_index && !space_index.zero?) ? rest[0..(space_index - 1)] : []
    @arguments  = space_index ? rest[(space_index + 1)..-1] : []
  end

  def root?
    self == @@root
  end

  def root!
    self.root = self
  end

  # @note No keyword argument
  def <<(raw_argument)
    @arguments << Expression.new(raw: raw_argument)
    raw.concat(raw)
  end

  alias_method :add_argument!, :<<

  def apply!
    @body.map! { |node| (node == @parameters.first) ? @arguments.first : node }

    @arguments.shift
    @parameters.shift
  end

  def reduce!
    apply! until @parameters.empty? || @arguments.empty?
    body.each { |node| node.reduce! if node.kind_of? Expression }
  end

  def to_s
    parameters  = "λ{ parameters.join }." unless parameters.empty?
    body        = body.map(&:to_s).join
    arguments   = arguments.map { |arg| "(#{ arg })" }.join
    stringified = "#{ parameters }#{ body } #{ arguments }"
    root? ? stringified : "(#{ stringified })"
  end
end
