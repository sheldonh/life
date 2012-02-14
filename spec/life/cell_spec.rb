require 'spec_helper'
require 'life/cell'

describe Life::Cell do

  describe "live" do

    let(:cell) { Life::Cell.live }

    it "transitions to dead for fewer than 2 live neighbours" do
      cell.transition(0).should == Life::Cell.dead
      cell.transition(1).should == Life::Cell.dead
    end

    it "remains live for 2 or 3 live neighbours" do
      cell.transition(2).should == Life::Cell.live
      cell.transition(3).should == Life::Cell.live
    end

    it "transitions to dead for more than 3 live neighbours" do
      cell.transition(4).should == Life::Cell.dead
      cell.transition(5).should == Life::Cell.dead
    end

  end

  describe "dead" do
    let(:cell) { Life::Cell.dead }

    it "remains dead for fewer than 3 live neighbours" do
      cell.transition(0).should == Life::Cell.dead
      cell.transition(2).should == Life::Cell.dead
    end

    it "transitions to live for 3 live neighbours" do
      cell.transition(3).should == Life::Cell.live
    end

    it "remains dead for more than 3 live neighbours" do
      cell.transition(4).should == Life::Cell.dead
      cell.transition(5).should == Life::Cell.dead
    end

  end

end
