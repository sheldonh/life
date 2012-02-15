module Life

  class Organism

    def initialize(nested_array)
      @structure = nested_array
    end

    def live?
      live_cells?(@structure)
    end

    def age!
      @structure = age_cells(@structure)
      self
    end

    def ==(other)
      @structure == other.instance_variable_get(:@structure)
    end

    private

    def age_cells(structure)
      now = []
      structure.each_with_index do |row, i|
        now[i] = []
        row.each_with_index do |cell, j|
          now[i][j] = cell.transition neighbours_of(i, j)
        end
      end
      now
    end

    def neighbours_of(i, j)
      neighbours = []
      (i - 1).upto(i + 1) do |x|
        (j - 1).upto(j + 1) do |y|
          if inbounds(x, y) && !(i == x && j == y)
            neighbours << @structure[x][y]
          end
        end
      end
      neighbours
    end

    def inbounds(x, y)
      x > 0 && y > 0 && x < @structure.size && y < @structure[0].size
    end

    def live_cells?(structure)
      if structure.is_a?(Life::Cell)
        structure == Life::Cell.live
      else
        structure.detect do |element|
          live_cells?(element)
        end
      end
    end

    def structure
      @structure
    end

  end

end
