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

    def mutate!(cell_perimeter)
      if alive? && cell_perimeter.alive_cells == 0
        @state = DEAD
      end

      if dead? && [2,3].include?(cell_perimeter.alive_cells)
        @state = ALIVE
      end
    end
    
  end
  
end
