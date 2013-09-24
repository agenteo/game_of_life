module GameOfLife

  class DeadCell < Cell

    def mutate!(cell_perimeter)
      mutation_result = mutation_trigger[cell_perimeter.alive_cells]
      @state = mutation_result
    end

    private

      def initial_state
        Cell::DEAD
      end

      def mutation_trigger
        { 0 => DEAD, 1 => DEAD, 2 => DEAD, 3 => ALIVE, 4 => DEAD,
          5 => DEAD, 6 => DEAD, 7 => DEAD, 8 => DEAD }
      end


  end
  
end
