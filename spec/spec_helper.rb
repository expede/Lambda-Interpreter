$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'lambda_interpreter'
require 'rubygems'
require 'factory_girl'

require_relative '../lib/lex/sanitize'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before(:each) do
    FactoryGirl.lint
  end
end
