module GameOfLife

  class CellPerimeter

    def initialize(cells)
      @cells = cells
    end
    
    def alive_cells
      @cells.count {|cell| cell.alive? }
    end
  end
  
end
