module Life

  class Cell

    def transition(neighbours)
      @transition_rule.call(neighbours) ? opposite : self
    end

    def self.dead
      unless defined?(@@dead)
        @@dead = new(->(c) {c == 3})
        @@dead.send(:opposite, live)
      end
      @@dead
    end

    def self.live
      unless defined?(@@live)
        @@live ||= new(->(c) {c < 2 || c > 3})
        @@live.send(:opposite, dead)
      end
      @@live
    end

    def self.random(chance = ->{rand(2)})
      case chance.call
      when 0 then self.live
      when 1 then self.dead
      else raise ArgumentError
      end
    end

    private

    def initialize(transition_rule)
      @transition_rule = transition_rule
    end

    def opposite(new_opposite = nil)
      @opposite = new_opposite if new_opposite
      @opposite
    end

  end

end
