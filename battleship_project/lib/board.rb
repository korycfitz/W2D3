class Board
    attr_reader :size
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = (n * n) #total size of grid
    end

    def [](position) #accepts position on board (array)
        row = position[0]
        column = position[1]
        #can also define position like this: row, column = position
        @grid[row][column] #returns element of grid at position (:Sym)
    end

    def []=(position, value)
        row = position[0]
        column = position[1]
        @grid[row][column] = value
    end

    def num_ships
        counter = 0
        (0...@grid.length).each do | idx1 |
            (0...@grid[0].length).each do | idx2 |
                counter += 1 if @grid[idx1][idx2] == :S
            end
        end
        counter         
    end

    def attack(position)
        # row = position[0]
        # column = position[1]
        current_pos = self.[](position) #sets current_pos to @grid[row][column] or a position
        current_pos=(:S) #sets current_pos= to :S
        if pos == :S
            self.[]=(position, :H)
        # if self.[](position) == :S
        # if @grid[row][column] == :S
            # @grid[row][column] = :H    #problem with either of these ways is that we are not calling Board#[] or Board[]=
            puts 'you sunk my battleship!'
        end
            

    end

end
