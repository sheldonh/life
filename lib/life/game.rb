module Life

  class Game

    def initialize(organism)
      @organism = organism
    end

    def run(&block)
      yield @organism
      @organism.age!
      while @organism.alive?
        yield @organism
        @organism.age!
      end
    end

  end

end
