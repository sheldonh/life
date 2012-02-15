require 'rspec'

require File.join(File.dirname(__FILE__), 'helpers', 'live_neighbours_helper.rb')
require File.join(File.dirname(__FILE__), 'helpers', 'cell_to_s_helper.rb')
require File.join(File.dirname(__FILE__), 'helpers', 'organism_to_s_helper.rb')

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
