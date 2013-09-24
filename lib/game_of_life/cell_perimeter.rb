module GameOfLife

  class CellPerimeter

    def initialize(cells)
      @cells = cells
    end
    
    def alive_cells
      @cells.inject(0) {|total, cell| total += cell.state }
    end
  end
  
end
