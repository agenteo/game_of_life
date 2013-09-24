require 'spec_helper'

module GameOfLife
  
  describe AliveCell do
    let(:cell) { AliveCell.new }

    shared_examples_for "a dead cell" do
      let(:perimeter) { double('CellPerimeter', :alive_cells => alive_cells) }
      it "should be dead", "state 0" do
        cell.mutate!(perimeter)
        cell.state.should == Cell::DEAD
      end
    end

    shared_examples_for "an alive cell" do
      let(:perimeter) { double('CellPerimeter', :alive_cells => alive_cells) }
      it "should be kept alive", "state 1" do
        cell.mutate!(perimeter)
        cell.state.should == Cell::ALIVE
      end
    end


    describe "#new" do
      it "should be alive", "state 1" do
        cell.state.should == 1
      end
    end

    describe "when mutating" do
      context "with no alive neighbor cells" do
        let(:alive_cells) { 0 }
        it_behaves_like "a dead cell"
      end

      context "with two alive neighbor cells" do
        let(:alive_cells) { 2 }
        it_behaves_like "an alive cell"
      end

      context "with three alive neighbor cells" do
        let(:alive_cells) { 3 }
        it_behaves_like "an alive cell"
      end

      context "with four alive neighbor cells" do
        let(:alive_cells) { 4 }
        it_behaves_like "a dead cell"
      end

      context "with five alive neighbor cells" do
        let(:alive_cells) { 5 }
        it_behaves_like "a dead cell"
      end

      context "with six alive neighbor cells" do
        let(:alive_cells) { 6 }
        it_behaves_like "a dead cell"
      end

      context "with seven alive neighbor cells" do
        let(:alive_cells) { 7 }
        it_behaves_like "a dead cell"
      end

      context "with eight alive neighbor cells" do
        let(:alive_cells) { 8 }
        it_behaves_like "a dead cell"
      end
    end

  end
end
