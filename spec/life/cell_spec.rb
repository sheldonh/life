require 'spec_helper'
require 'life/cell'

describe Life::Cell do

  it "has one live instance" do
    Life::Cell.live.should be_a(Life::Cell)
    Life::Cell.live.object_id.should == Life::Cell.live.object_id
  end

  it "has one dead instance" do
    Life::Cell.dead.should be_a(Life::Cell)
    Life::Cell.dead.object_id.should == Life::Cell.dead.object_id
  end

  it "offers random access to the live or dead instance" do
    Life::Cell.random.should be_a(Life::Cell)
  end

  describe ".live" do

    let(:cell) { Life::Cell.live }

    it "transitions to dead for fewer than 2 live neighbours" do
      cell.transition(0.live_neighbours).should == Life::Cell.dead
      cell.transition(1.live_neighbours).should == Life::Cell.dead
    end

    it "remains live for 2 or 3 live neighbours" do
      cell.transition(2.live_neighbours).should == Life::Cell.live
      cell.transition(3.live_neighbours).should == Life::Cell.live
    end

    it "transitions to dead for more than 3 live neighbours" do
      cell.transition(4.live_neighbours).should == Life::Cell.dead
      cell.transition(5.live_neighbours).should == Life::Cell.dead
    end

  end

  describe ".dead" do
    let(:cell) { Life::Cell.dead }

    it "remains dead for fewer than 3 live neighbours" do
      cell.transition(0.live_neighbours).should == Life::Cell.dead
      cell.transition(2.live_neighbours).should == Life::Cell.dead
    end

    it "transitions to live for 3 live neighbours" do
      cell.transition(3.live_neighbours).should == Life::Cell.live
    end

    it "remains dead for more than 3 live neighbours" do
      cell.transition(4.live_neighbours).should == Life::Cell.dead
      cell.transition(5.live_neighbours).should == Life::Cell.dead
    end

  end

  describe ".random" do

    let(:half_of_the_time) { ->{0} }
    let(:the_other_half_of_the_time) { ->{1} }

    it "returns a dead cell 50% of the time" do
      Life::Cell.random(half_of_the_time).should == Life::Cell.dead
    end

    it "returns a live cell the other 50% of the time" do
      Life::Cell.random(the_other_half_of_the_time).should == Life::Cell.live
    end

    it "raises an ArgumentError for any other percentage of the time" do
      expect { Life::Cell.random(->{-1}) }.to raise_error(ArgumentError)
      expect { Life::Cell.random(->{2}) }.to raise_error(ArgumentError)
    end

  end

end
