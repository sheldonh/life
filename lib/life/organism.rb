module Life

  class Organism

    def initialize(timer = ->{})
      @timer = timer
    end

    def age!
      @timer.call
    end

  end

end
