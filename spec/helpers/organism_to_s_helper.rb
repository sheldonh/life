require 'life/presenter/organism'

module Life

  class Organism

    def to_s
      dup.extend(Life::Presenter::Organism).render
    end

  end

end
