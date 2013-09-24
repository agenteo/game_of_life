require 'spec_helper'

module GameOfLife

  describe Cell do
  
    shared_examples_for "a dead cell" do
      let(:perimeter) { double('CellPerimeter', :alive_cells => alive_cells) }

      it "should die" do
        cell.mutate!(perimeter)
        cell.should be_dead
      end
    end

    shared_examples_for "an alive cell" do
      let(:perimeter) { double('CellPerimeter', :alive_cells => alive_cells) }

      it "should be alive" do
        cell.mutate!(perimeter)
        cell.should be_alive
      end
    end

    context "with a live cell" do
      let(:cell) { Cell.new(Cell::ALIVE) }

      it "should be alive" do
        cell.should be_alive
      end

      it "should not be dead" do
        cell.should_not be_dead
      end

      describe "when mutating" do
        context "with no alive neighbor cells" do
          let(:alive_cells) { 0 }
          it_should_behave_like "a dead cell"
        end
      end
      
    end

    context "with a dead cell" do
      let(:cell) { Cell.new(Cell::DEAD) }

      it "should be dead" do
        cell.should be_dead
      end

      it "should not be alive" do
        cell.should_not be_alive
      end

      describe "when mutating" do
        context "with no alive neighbor cells" do
          let(:alive_cells) { 0 }
          it_should_behave_like "a dead cell"
        end

        context "with one alive neighbor cells" do
          let(:alive_cells) { 1 }
          it_should_behave_like "a dead cell"
        end

        context "with two alive neighbor cells" do
          let(:alive_cells) { 2 }
          it_should_behave_like "an alive cell"
        end

        context "with three alive neighbor cells" do
          let(:alive_cells) { 3 }
          it_should_behave_like "an alive cell"
        end

        context "with four alive neighbor cells" do
          let(:alive_cells) { 4 }
          it_should_behave_like "a dead cell"
        end
      end
    end
  end
  
end
