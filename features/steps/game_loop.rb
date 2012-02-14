require 'life/game'

class GameLoop < Spinach::FeatureSteps

  feature 'game loop'

  Given 'an organism' do
    @organism = double(Life::Organism)
  end

  When 'I wrap the organism in a game' do
    @game = Life::Game.new(@organism)
  end

  And 'I run the game' do
    @game.run do |game|

    end
  end

  Then 'the game ages the organism until the organism dies' do
    raise 'step not implemented'
  end
end

descr = <<DESCR
X-X-X
-X-X-
X-X-X
DESCR
organism = Life::Organism.parse(descr)
game = Life::Game.new(organism)
game.run do |organism|
  display organism
  sleep 1
end
