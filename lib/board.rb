            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/Tic_Tac_Toe

class Board

# The Board class is responsible for adding a player's marks, checking for winners, 
# and printing the game board. A board instance must have an attribute to represent 
# the grid. For simplicity, give the grid the dimensions of classic tic-tac-toe, 3x3.

# Board#initialize

# A Board instance must have an instance variable to represent the game grid. For 
# now, Board#initialize does not need to accept any arguments. Initialize the grid 
# so that all positions are empty; this means that every position should contain an 
# underscore ('_').

    def initialize()
        @grid = Array.new(3) { Array.new(3).fill(:_) }
    end

# Board#valid?(position)

# This method should return a boolean indicating whether or not the specified position 
# is valid for the board, meaning the position is not "out of bounds."

    def valid?(position)
        position.all? { |num| (0..2).include?(num) }
    end

# Board#empty?(position)

# This method should return a boolean indicating whether or not the specified position 
# does not contain a player's mark.

    def empty?(position)
        if @grid[position[0]][position[1]] == :_
            true
        else false
        end
    end

# Board#place_mark(position, mark)

# This method should assign the given mark to the specified position of the grid. 
# It should raise an error when the position is not #valid? or not #empty?.

    def place_mark(position, mark)
      if valid?(position) && empty?(position) 
            @grid[position[0]][position[1]] = mark
      elsif  empty?(position) && valid?(position)
                @grid[position[0]][position[1]] = mark
      else puts 'try again'
      end  
    end

# Checkpoint - Board yet?
# At this point you've written a few Board methods that are critical to the gameplay. 
# Now's a good opportunity to pause and test our code for correctness. A quick way 
# to test is to use pry.

# Board#print

# This method should simply print out the board and all of the marks that have been 
# placed on it. Feel free to style the printing as much as you'd like, but be sure 
# to print out each row of the board on a new line. This will help us visualize the 
# board better as we debug or even play the game!

    def print
        @grid.each { |row| puts row.join(' ') }
    end

# Board#win_row?(mark)

# This method should return a boolean indicating whether or not the given mark has 
# completely filled up any row of the grid.

    def win_row?(mark)
        @grid.one? { |row| row.all? { |ele| ele == mark } }
    end

# Board#win_col?(mark)

# This method should return a boolean indicating whether or not the given mark has 
# completely filled up any column of the grid.

    def win_col?(mark)
        @grid.transpose.one? { |col| col.all? { |ele| ele == mark } }
    end

# Board#win_diagonal?(mark)

# This method should return a boolean indicating whether or not the given mark has 
# completely filled up either diagonal of the grid.

    def win_diagonal?(mark)
        if @grid[0][0] == mark && @grid[1][1] == mark && @grid[2][2] == mark
            true
        elsif @grid[0][2] == mark && @grid[1][1] == mark && @grid[2][0] == mark
            true
        else false
        end
    end

# Board#win?(mark)

# This method should return a boolean indicating whether or not the given mark has 
# filled any full row, column, or diagonal.

    def win?(mark)
        if win_row?(mark)
            true
        elsif win_col?(mark)
            true
        elsif win_diagonal?(mark)
            true
        else false
        end
    end

# Board#empty_positions?

# This method should return a boolean indicating whether or not there is at least 
# one empty position on the grid.

    def empty_positions?
        @grid.any? { |row| row.any? { |ele| ele == :_ } }
    end

# Checkpoint - You're all winners
# If you haven't already, take a moment to use pry to test your win-checking logic. 
# Use your #place_mark to set the board up and #print to visually verify any winners. 
# We'll leave it to you to decide reasonable test scenarios. As a rule of thumb for 
# methods with boolean returns, be sure to test for "false-positives" and "false-
# negatives". In other words, verify that #win? and the related methods return true 
# when they should and return false when they should. Don't forget to test your 
# #empty_positions? method as well!
end

            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/Tic_Tac_Toe
