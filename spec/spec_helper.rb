$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
#require 'lambda_interpreter'
require 'rubygems'
require 'rspec'
require 'factory_girl'

require_relative './support/factories'
require_relative '../lib/lex/sanitize'
require_relative '../lib/expression'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before(:each) do
    FactoryGirl.lint
  end
end

class InputString
  attr_accessor :parameters, :body, :arguments, :complete
  def new(string:)
    string
  end
end
