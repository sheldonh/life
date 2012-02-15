require 'spec_helper'

require 'life/presenter/organism'
require 'life/organism'

describe Life::Organism do

  let(:parser) { ->(presentation) { Life::Organism.extend(Life::Presenter::Organism).parse presentation } }

  describe "single-celled" do

    it "is live if its cell is live" do
      parser.call('X').should be_live
    end

    it "is not live if its cell is dead" do
      parser.call('.').should_not be_live
    end

    it "dies as soon as it ages" do
      parser.call('X').age!.should_not be_live
    end

  end

  describe "block" do

    # ....
    # .XX.
    # .XX.
    # ....
    let(:new_block) { -> { parser.call "....\n.XX.\n.XX.\n....\n" } }

    it "is stable" do
      reference_block = new_block.call
      block = new_block.call
      block.age!.should == reference_block
    end

  end

  describe "diamond" do

    # .....
    # ..X..
    # .X.X.
    # ..X..
    # .....
    let(:new_diamond) { -> { parser.call ".....\n..X..\n.X.X.\n..X..\n.....\n" } }

    it "is stable" do
      reference_diamond = new_diamond.call
      diamond = new_diamond.call
      diamond.age!.should == reference_diamond
      puts diamond.age!
    end

  end

end
