require 'spec_helper'

module GameOfLife

  describe Cell do
  
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
          before do
            @neighbor_cells = [
              [double('Cell', :alive? => false), double('Cell', :alive? => false), double('Cell', :alive? => false)],
              [double('Cell', :alive? => false), double('Cell', :alive? => false), double('Cell', :alive? => false)],
              [double('Cell', :alive? => false), double('Cell', :alive? => false), double('Cell', :alive? => false)],
              [double('Cell', :alive? => false), double('Cell', :alive? => false), double('Cell', :alive? => false)]
            ]
          end

          it "should die" do
            cell.mutate!(@neighbor_cells)
            cell.should be_dead
          end
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
          before do
            @neighbor_cells = [
              [double('Cell', :alive? => false), double('Cell', :alive? => false), double('Cell', :alive? => false)],
              [double('Cell', :alive? => false), double('Cell', :alive? => false), double('Cell', :alive? => false)],
              [double('Cell', :alive? => false), double('Cell', :alive? => false), double('Cell', :alive? => false)],
              [double('Cell', :alive? => false), double('Cell', :alive? => false), double('Cell', :alive? => false)]
            ]
          end

          it "should stay dead" do
            cell.mutate!(@neighbor_cells)
            cell.should be_dead
          end
        end

        context "with one alive neighbor cells" do
          before do
            @neighbor_cells = [
              [double('Cell', :alive? => true), double('Cell', :alive? => false), double('Cell', :alive? => false)],
              [double('Cell', :alive? => false), double('Cell', :alive? => false), double('Cell', :alive? => false)],
              [double('Cell', :alive? => false), double('Cell', :alive? => false), double('Cell', :alive? => false)],
              [double('Cell', :alive? => false), double('Cell', :alive? => false), double('Cell', :alive? => false)]
            ]
          end

          it "should stay dead" do
            cell.mutate!(@neighbor_cells)
            cell.should be_dead
          end
        end

        context "with two alive neighbor cells" do
          before do
            @neighbor_cells = [
              [double('Cell', :alive? => true), double('Cell', :alive? => true), double('Cell', :alive? => false)],
              [double('Cell', :alive? => false), double('Cell', :alive? => false), double('Cell', :alive? => false)],
              [double('Cell', :alive? => false), double('Cell', :alive? => false), double('Cell', :alive? => false)],
              [double('Cell', :alive? => false), double('Cell', :alive? => false), double('Cell', :alive? => false)]
            ]
          end

          it "should resuscitate back to alive" do
            cell.mutate!(@neighbor_cells)
            cell.should be_alive
          end
        end
      end
    end
  end
  
end
