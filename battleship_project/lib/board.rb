class Board
    require 'byebug'
    attr_reader :size

    def self.print_grid(grid)
        grid.each do | row |
            row.join(" ")
            row.map do | ele |
                ele + " "
            end

            puts row
        end
    end



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

    def []= (position, value)
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
                            #   # Note:
                            #   board[pos] = :S       # this line...
        #instance method    #   board.[]=(pos, :S)    # is same as this line. :)
    def attack(position) #array             [  position ]
#       # if self[position] #if board_instance[  [3, 4]   ]  
#         #if board_instance[position] 
#         #if self[position] = :S
#         if self[position] = :S #same as writing  self.[]=(position, :H) ^
#             self.[]=(position, :H)
#             puts 'you sunk my battleship!'
#             return true
#         end

#         if self[position] != :S
#             self[position] = :X
#             return false
#         end



#     end
# 
#the # code below subbed in for each line below it doesn't call on board so it doesnt pass one of the specs tried to solve above but couldn't solved below
        row = position[0]
        column = position[1]
        # if @grid[row][column] == :S 
        if self.[](position) == :S     #if value (at instance) = :S
            # @grid[row][column] = :H    #problem with either of these ways is that we are not calling Board#[] or Board[]=
            self.[]=(position, :H)     #value= (at instance) :H
            # self[position]= :H        #same as code above
            puts 'you sunk my battleship!'
            return true
        end
        if @grid[row][column] != :S
            # @grid[row][column] = :X
            self.[]=(position, :X)
            return false
        end
    end

    def place_random_ships
        while @grid.flatten.count(:S) < @size / 4
            #random generate row|column
            row = rand(0...@grid.length)
            col = rand(0...@grid[0].length)
            @grid[row][col] = :S
        end
    end

    def hidden_ships_grid #return 2D array representing the grid where every :S is replace with an :N
        # hidden_grid = @grid.dup
        # @grid.map(&:object_id)
        # hidden_grid.map(&:object_id)
        @grid.map do | row |
            row.map do | ele |
                # debugger
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end



end



