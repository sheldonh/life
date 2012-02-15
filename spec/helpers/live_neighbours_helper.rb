require 'life/cell'

class LiveNeighboursHelper

  def initialize(live, total)
    @live, @total = live, total
  end

  def live_neighbours
    neighbours = []
    (@total - @live).times { neighbours << Life::Cell.dead }
    @live.times { neighbours << Life::Cell.live }
    neighbours
  end

end

class Integer

  def of(total)
    LiveNeighboursHelper.new(self, total)
  end

  def live_neighbours
    self.of(8).live_neighbours
  end

end

