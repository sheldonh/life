require 'life/cell'

module Life

  module Presenter

    module Organism

      def parse(string)
        structure = [ inner = [] ]
        string.chars.each do |char|
          case char
          when 'X' then inner << Life::Cell.live
          when '.' then inner << Life::Cell.dead
          when '?' then inner << Life::Cell.random
          when "\n" then structure << (inner = [])
          else raise ArgumentError
          end
        end
        structure.reject! {|o| o.empty? }
        Life::Organism.new structure
      end

      def render(internal_structure = nil)
        internal_structure ||= structure
        internal_structure.inject('') do |s, element|
          if element.is_a?(Life::Cell)
            s << (element == Life::Cell.live ? 'X' : '.')
          else
            s << render(element) + "\n"
          end
        end
      end

    end

  end

end
