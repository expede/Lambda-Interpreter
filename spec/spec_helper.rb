$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
#require 'lambda_interpreter'
require 'rubygems'
require 'rspec'
require 'factory_girl'

require_relative '../lib/lex/sanitize'
require_relative '../lib/model/expression'
require_relative '../lib/model/variable_space'

require_relative './support/factories'

# RSpec.configure do |config|
  # config.include FactoryGirl::Syntax::Methods
  # config.before(:each) { FactoryGirl.lint }
# end

# Simply to help construct input; no use in the actual code
class InputString
  attr_accessor :parameters, :body, :arguments, :complete
  def new(string:)
    string
  end
end
