class TicTacToe
	@@board = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
	@@used = 0

	def printBoard
		puts "\n " + @@board[1] + " | " + @@board[2] + " | " + @@board[3]
		puts "---|---|---"
		puts " " + @@board[4] + " | " + @@board[5] + " | " + @@board[6]
		puts "---|---|---"
		puts " " + @@board[7] + " | " + @@board[8] + " | " + @@board[9] + "\n"
	end

	def thereIsAWinner
		# check for horizontal wins:
		i = 1
		while i < 9
			if @@board[i] == @@board[i+1] && @@board[i+1] == @@board[i+2]
				puts "Horizontal win on row %s" % [i]
				return true
			end
			i += 3
		end

		# check for vertical wins:
		i = 1
		while i < 9
			if @@board[i] == @@board[i+3] && @@board[i+3] == @@board[i+6]
				puts "Vertical win on column %s" % [i]
				return true
			end
			i += 3
		end

		# check for diagonal wins
		if @@board[1] == @@board[5] && @@board[5] == @@board[9]
			puts "Inverse diagonal win"
			return true
		end

		if @@board[3] == @@board[5] && @@board[5] == @@board[7]
			puts "Diagonal win"
			return true
		end

		# return false if no wins.
		false
	end

	def isThisBoxAvailable(n)
		if @@board[n] == "X" || @@board[n] == "O"
			return true
		else
			return false
		end
	end
end

def playTicTacToe

	game = TicTacToe.new

	puts "\nLet's play Tic Tac Toe!\nYou will be X, and I will be O."
	game.printBoard
	puts "\nYou go first. Enter the number of the box\nyou want to place your X. Enter 'q' to quit."

	#input = gets.chomp

	#while input != "q"
	#	processInput
	#	input = gets.chomp
	#end

	true
end

