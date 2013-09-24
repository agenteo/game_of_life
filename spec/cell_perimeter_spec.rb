require 'spec_helper'

module GameOfLife

  describe CellPerimeter do
    context "with no alive cells" do
      let(:cells) {
        [double('Cell', :alive? => false),
         double('Cell', :alive? => false),
         double('Cell', :alive? => false),
         double('Cell', :alive? => false),
         double('Cell', :alive? => false),
         double('Cell', :alive? => false),
         double('Cell', :alive? => false),
         double('Cell', :alive? => false)]
      }
      
      it "should have zero alive cells" do
        perimeter = CellPerimeter.new(cells)
        perimeter.alive_cells.should == 0
      end
    end

    context "with one alive cell" do
      let(:cells) {
        [double('Cell', :alive? => false),
         double('Cell', :alive? => true),
         double('Cell', :alive? => false),
         double('Cell', :alive? => false),
         double('Cell', :alive? => false),
         double('Cell', :alive? => false),
         double('Cell', :alive? => false),
         double('Cell', :alive? => false)]
      }
      
      it "should have zero alive cells" do
        perimeter = CellPerimeter.new(cells)
        perimeter.alive_cells.should == 1
      end
    end
    
  end
end
