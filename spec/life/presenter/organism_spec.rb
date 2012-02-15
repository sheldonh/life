require 'spec_helper'

require 'life/organism'
require 'life/presenter/organism'

describe Life::Presenter::Organism do

  let(:presented) { double("Life::Organism").tap {|o| o.extend(Life::Presenter::Organism) } }

  describe ".parse" do

    it "treats an 'X' as a live cell" do
      Life::Cell.should_receive(:live).and_return(:live_cell)
      Life::Cell.should_not_receive(:dead)
      presented.parse('X').should be_a(Life::Organism)
    end

    it "treats a '.' as a dead cell" do
      Life::Cell.should_receive(:dead).and_return(:dead_cell)
      Life::Cell.should_not_receive(:live)
      presented.parse('.').should be_a(Life::Organism)
    end

    it "treats a '?' as a random cell" do
      Life::Cell.should_receive(:random).and_return(:random_cell)
      Life::Cell.should_not_receive(:live)
      Life::Cell.should_not_receive(:dead)
      presented.parse('?').should be_a(Life::Organism)
    end

    it "treats newlines as row delimiters" do
      presented.parse("X\n.").instance_variable_get(:@structure).should == [ [Life::Cell.live], [Life::Cell.dead] ]
    end

    it "ignores empy lines" do
      presented.parse("\n\nX\n\n.\n\n").instance_variable_get(:@structure).should == [ [Life::Cell.live], [Life::Cell.dead] ]
    end

  end

  describe ".render" do

    let(:box) { presented.parse("....\n.XX.\n.XX.\n....\n") }
    let(:rendered) { box.extend(Life::Presenter::Organism) }

    it "renders a box faithfully" do
      rendered.render.should == "....\n.XX.\n.XX.\n....\n"
    end

  end

end
