require 'life/instance_cache'

module Life

  class Cell

    include InstanceCache

    def transition(neighbours)
      live_count = neighbours.select {|o| o == Life::Cell.live }.size
      @when.call(live_count) ? @becomes.call : self
    end

    def self.dead
      cache_instance :dead do
        new becomes: -> {live},
            when: ->(live_count) {live_count == 3}
      end
    end

    def self.live
      cache_instance :live do
        new becomes: -> {dead},
            when: ->(live_count) {live_count < 2 || live_count > 3}
      end
    end

    def self.random(chance = ->{rand(2)})
      case chance.call
      when 0 then self.dead
      when 1 then self.live
      else raise ArgumentError
      end
    end

    private

    def initialize(attrs)
      @becomes, @when = attrs[:becomes], attrs[:when]
    end

  end

end
