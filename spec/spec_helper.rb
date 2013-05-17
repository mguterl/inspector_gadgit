require 'inspector_gadgit'
require 'rspec'
require 'pry'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include RepositoryHelpers
end
