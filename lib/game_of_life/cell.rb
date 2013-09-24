module GameOfLife

  class Cell
    ALIVE=1
    DEAD=0
    attr_reader :state

    def initialize
      @state = initial_state
    end

    def mutate!(cell_perimeter)
      raise 'Has to be implemented!'
    end

    private

      def initial_state
        raise 'Has to be implemented!'
      end
    
  end
  
end
