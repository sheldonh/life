require 'rspec'
#Spinach::FeatureSteps.send(:include, RSpec::Matchers)
Spinach::FeatureSteps.send(:include, RSpec::Mocks::ExampleMethods)

$:.unshift File.join(File.dirname(__FILE__), '..', '..', 'lib')
