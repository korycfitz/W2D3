class Board
    attr_reader :size
    def initialize(n)
        @grid = Array.new(n) {Array.new(n)}
        @size  = (n * n) #total size of grid
    end

end
