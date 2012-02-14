require 'spec_helper'

require 'life/organism'

describe Life::Organism do

  describe "single-celled" do

    it "dies as soon as it ages" do
      organism = Life::Organism.new(Life::Cell::ALIVE)
      export { organism.age! }.to change { organism.alive? }.to false
    end

  end

  describe "over time" do

    class SimpleTimer

      def tick!
        @ticks ||= 0
        @ticks += 1
      end

      def ticks
        @ticks ||= 0
      end

    end

    let(:timer) { SimpleTimer.new }

    it "ages" do
      organism = Life::Organism.new(->{timer.tick!})
      organism.age!
      expect { organism.age! }.to change {timer.ticks}.by(1)
    end

  end

  describe "lifecycle" do

    it "is alive if it has at least one living cell" do
    end

  end

end
