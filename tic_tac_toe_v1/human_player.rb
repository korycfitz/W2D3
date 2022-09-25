#responsible for holding information about the user and prompting them to enter a position for gameplay
class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        begin
            puts "It is #{mark}'s Turn!"
            puts "Please Enter a Row Number (Enter 1 to select the Top Row, 2 to select the Second Row, and 3 to select the Bottom Row)"
            row = (gets.chomp.to_i) - 1

            if ![0,1,2].include?(row)
                raise "invalid input"
        rescue => error
            puts "please enter a single number between 1 and 3"
            retry
            end

        end

        begin
            puts "It is #{mark}'s Turn!"
            puts "Please Enter a Column Number (Enter 1 to select the Left-most Column, 2 to select the Middle, and 3 to select the Right Column)"
            col = (gets.chomp.to_i) - 1
            if ![0,1,2].include?(col)
                raise "invalid input"
        rescue => error
            puts "please enter a single number between 1 and 3"
            retry
            end
        end

        end

        return [row, col]
    end



end

