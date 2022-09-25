#will add a player's marks, check for winners, and print the game board
class Board

    def initialize
        @grid = Array.new(3) { Array.new(3, "_") } 
    end

    def valid?(position) #position is an array length 2 [length_width] #check if out of bounce return boolean if valid
        if (position[0] <= 2 && position[0] >=0) && (position[1] <= 2 && position[1] >=0)
            return true
        end

        false
    end

    def empty?(position)
        if @grid[position[0]][position[1]] == '_'
            return true
        else
            return false
        end
    end


    def place_mark(position, mark)
        if !valid?(position) || !empty?(position) 
            raise ArgumentError.new "position not valid"
        else 
            @grid[position[0]][position[1]] = mark
        end
    end

    def print
        p @grid[0]
        p @grid[1]
        p @grid[2]
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.all? { |ele| ele == mark } 
        end
        false
    end

    def win_col?(mark)
        (0...@grid[0].length).each do |i|
            return true if @grid.all? { | row | row[i] == mark }
        end
        false
    end
    
    def win_diagonal?(mark)
        counter = 0
            (0...@grid.length).each do |row|
                (0...@grid[0].length).each do | column | 
                    if row == column && @grid[row][column] == mark
                        counter += 1
                    end
                end
            end
            if counter == 3 
                return true
            end

            counter = 0
            (0...@grid.transpose.length).each do |row|
                (0...@grid.transpose.length).each do | column | 
                    if row == column && @grid.transpose[row][column] == mark
                        counter += 1
                    end
                end
            end
            if counter == 3 
                return true
            end

        false
    end

    def win?(mark)
        return true if win_diagonal?(mark) || win_col?(mark) || win_row?(mark)
        false
    end

    def empty_positions?
        @grid.each do |row|
            row.each do |ele|
                return true if ele == "_" 
            end
        end
    end

end

