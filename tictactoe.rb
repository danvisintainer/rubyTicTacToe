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
			return false
		else
			return true
		end
	end

	def myAtoI(s)
		return s.ord - 48
	end
	

	def computerTurn
		puts "\nMy turn!"
		tookTurn = false
		# I'll be trying my hand at a rather defensive AI
		# First it'll check to see if the player is about to win, and if so,
		# attempt to cut them off.

		# check for horizontal dangers:
		i = 1	
		n = 0

		while i < 9 && n < 2
			n = 0	# this is used to count up the number of "X"s - if there's
					# 2 in a row, column, that's dangerous for the computer
			j = 0
			while j <= 3
				if @@board[i + j] == "X"
					n += 1
				end
				j += 1
			end

			if n == 2	# if a danger is detected (2 "X"s on a row), it'll cut
						# off the player.
				puts "Horizontal danger found! (i = %s)" % [i]
				if @@board[i] != "O" && @@board[i] != "X"
					@@board[i] = "O"
					tookTurn = true
				elsif @@board[i+1] != "O" && @@board[i+1] != "X"
					@@board[i+1] = "O"
					tookTurn = true
				elsif @@board[i+2] != "O" && @@board[i+2] != "X"
					@@board[i+2] = "O"
					tookTurn = true
				else
					puts "Hmm, there's been an unexpected problem."
				end

			end

			i += 3
		end

		while i < 9 && n < 2
			n = 0	# this is used to count up the number of "X"s - if there's
					# 2 in a row, column, that's dangerous for the computer
			j = 0
			while j <= 3
				if @@board[i + j] == "X"
					n += 1
				end
				j += 1
			end

			if n == 2	# if a danger is detected (2 "X"s on a row), it'll cut
						# off the player.
				puts "Horizontal danger found! (i = %s)" % [i]
				if @@board[i] != "O" && @@board[i] != "X"
					@@board[i] = "O"
					tookTurn = true
				elsif @@board[i+1] != "O" && @@board[i+1] != "X"
					@@board[i+1] = "O"
					tookTurn = true
				elsif @@board[i+2] != "O" && @@board[i+2] != "X"
					@@board[i+2] = "O"
					tookTurn = true
				else
					puts "Hmm, there's been an unexpected problem."
				end

			end

			i += 3
		end

		printBoard
	end

	def go
		input = gets.chomp

		while input != "q"
			if input.ord >= 49 && input.ord <= 57
				if isThisBoxAvailable(myAtoI(input))
					@@board[myAtoI(input)] = "X"
					@@used += 1
					printBoard

					if @@used >= 5 && thereIsAWinner
						puts "There is a winner!"
						return true
					elsif @@used >= 9
						puts "It's a draw game...!"
						return true
					else
						computerTurn
					end
						
				else
					puts "Hey, that square is already taken! Try another one."
				end
			else
				puts "Hey, I don't recognize that input. Try again!"
			end

			puts "\nIt's your turn!"
			input = gets.chomp
		end
	end
end

def playTicTacToe

	game = TicTacToe.new

	puts "\nLet's play Tic Tac Toe!\nYou will be X, and I will be O."
	game.printBoard
	puts "\nYou go first. Enter the number of the box\nyou want to place your X. Enter 'q' to quit."

	game.go

	true
end

