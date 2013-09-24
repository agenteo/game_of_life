module GameOfLife

  class AliveCell < Cell
    
    def mutate!(cell_perimeter)
      alive_cells = cell_perimeter.alive_cells
      case alive_cells
        when 0
          @state = DEAD
        when 4,5,6,7,8
          @state = DEAD
      end
    end

    private

      def initial_state
        Cell::ALIVE
      end

      def mutation_trigger
        { 0 => DEAD, 1 => DEAD, 2 => ALIVE, 3 => ALIVE, 4 => DEAD,
          5 => DEAD, 6 => DEAD, 7 => DEAD, 8 => DEAD }
      end

  end

end
