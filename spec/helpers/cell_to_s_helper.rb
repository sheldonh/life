module Life

  class Cell

    def to_s
      if self == Life::Cell.live
        'Cell<live>'
      else
        'Cell<dead>'
      end
    end

  end

end

