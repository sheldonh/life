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
      if structure.is_a?(Life::Cell)
        structure.transition([]) # TODO supports only single-celled organisms where cells have no neighbours
      else
        structure.inject([]) do |memo, element|
          memo << age_cells(element)
        end
      end
    end

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
      coords = []
      coords << [i - 1, j - 1] << [i - 1, j] << [i - 1, j + 1]
      coords << [i, j - 1] << [i, j + 1]
      coords << [i + 1, j - 1] << [i + 1, j] << [i + 1, j + 1]
      coords.map {|x, y| @structure[x, y] }
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
