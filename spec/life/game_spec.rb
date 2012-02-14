require 'spec_helper'

require 'life/game'

describe Life::Game do

  describe "game loop" do

    class ShortLivedOrganism

      def initialize(lifespan = 2)
        @lifespan = lifespan
      end

      def alive?
        @lifespan > 0
      end

      def age!
        @lifespan -= 1
      end

    end

    let(:organism) { ShortLivedOrganism.new }

    it "ages the organism until it dies" do
      game = Life::Game.new(organism)
      lifespan = 0
      game.run do |o|
        o.should == organism
        lifespan += 1
      end
      lifespan.should == 2
    end

  end

end
