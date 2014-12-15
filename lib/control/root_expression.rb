require 'singleton'

module Control
  class RootExpression < ::Expression
    include Singleton
  end
end
