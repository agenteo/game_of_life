module GameOfLife

  class Cell
    ALIVE=:alive
    DEAD=:dead

    def initialize(state)
      @state = state
    end

    def alive?
      @state == ALIVE
    end
    
    def dead?
      @state == DEAD
    end

    def mutate!(neighbor_cells)
      total_alive_neighbors = neighbor_cells.flatten.count {|cell| cell.alive? }

      if alive? && total_alive_neighbors == 0
        @state = DEAD
      end

      if dead? && total_alive_neighbors == 2
        @state = ALIVE
      end
    end
    
  end
  
end
