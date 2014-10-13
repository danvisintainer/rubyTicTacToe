# Command-Line Tic-Tac-Toe - Dan Visintainer
# To play this, load it in IRB or a Ruby runtime environment and run
# "playTicTacToe".
#
# This is a Ruby implementation of a command line Tic Tac Toe that I
# did in order to familiarize myself with Ruby. It could be much more
# efficient, but it works.

class TicTacToe
	@@board = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
	@@used = 0
	@@winner = ""
	@@turn = 0

	# printBoard outputs the current board to the screen in a [semi]readable
	# format
	def printBoard
		puts "\n            |     |     "
		puts "         " + @@board[1] + "  |  " + @@board[2] + "  |  " + @@board[3]
		puts "            |     |     "
		puts "       -----+-----+-----"
		puts "            |     |     "
		puts "         " + @@board[4] + "  |  " + @@board[5] + "  |  " + @@board[6]
		puts "            |     |     "
		puts "       -----+-----+-----"
		puts "            |     |     "
		puts "         " + @@board[7] + "  |  " + @@board[8] + "  |  " + @@board[9] + "\n"
		puts "            |     |     "
	end

	# reset initializes the board back to the initial state
	def reset
		@@board = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
		@@used = 0
		@@winner = ""
	end

	# thereIsAWinner checks the board to see if someone won the game - returns
	# "true" if so, and "false" otherwise. it also records what the winner is
	# in the @@winner variable
	def thereIsAWinner
		# check for horizontal wins:

		i = 1
		while i < 9
			if @@board[i] == @@board[i+1] && @@board[i+1] == @@board[i+2]
				@@winner = @@board[i]
				return true
			end
			i += 3
		end

		# check for vertical wins:
		i = 1
		while i < 4
			if @@board[i] == @@board[i+3] && @@board[i+3] == @@board[i+6]
				@@winner = @@board[i]
				return true
			end
			i += 1
		end

		# check for diagonal wins
		if @@board[1] == @@board[5] && @@board[5] == @@board[9]
				@@winner = @@board[1]
				return true
		end

		if @@board[3] == @@board[5] && @@board[5] == @@board[7]
				@@winner = @@board[3]
				return true
		end

		# return false if no wins.
		false
	end

	# isThisBoxAvailable is a quick function to determine whether a box has
	# been used. returns "true" if available, "false" otherwise.
	def isThisBoxAvailable(n)
		if @@board[n] == "X" || @@board[n] == "O"
			return false
		else
			return true
		end
	end

	# myAtoI is a very quick-and-dirty aToI function
	def myAtoI(s)
		return s.ord - 48
	end
	
	# computerTurn is the function in which the computer takes its turn.
	# i tried my hand at a rather defensive AI that prioritizes cutting off
	# the player from winning rather than try to win on its own.

	# first, if it has the opportunity to win on its turn, it will do so
	# immediately. it will then check to see if it's in a situation in which
	# the player is about to win, and if so, try to cut off the player.
	# lastly, if none of those scenarios apply then it will just pick a
	# random available spot.
	def computerTurn
		puts "\nMy turn!"
		tookTurn = false
		unused = []	

		# Here the program will check to see if it can win horizontally:
		i = 1	
		n = 0

		while i < 9 && n < 2 && tookTurn == false
			n = 0	# this is used to count up the number of "O"s.
					# if 2 "O"s are detected on the same row, it will finish the row
					# and win.
			j = 0
			while j < 3
				if @@board[i + j] == "O"
					n += 1
				end
				j += 1
			end

			if n == 2	
				# here, 
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
				end

			end

			i += 3
		end

		# now, we'll check to see if it can win vertically.
		n = 0
		i = 1
		while i < 4 && n < 2 && tookTurn == false
		# the tookTurn check is to ensure the program does not take two turns
			n = 0
			j = 0
			while j <= 9
				if @@board[i + j] == "O"
					n += 1
				end
				j += 3
			end

			if n == 2	
				if @@board[i] != "O" && @@board[i] != "X"
					@@board[i] = "O"
					tookTurn = true
				elsif @@board[i+3] != "O" && @@board[i+3] != "X"
					@@board[i+3] = "O"
					tookTurn = true
				elsif @@board[i+6] != "O" && @@board[i+6] != "X"
					@@board[i+6] = "O"
					tookTurn = true
				else
				end

			end

			i += 1
		end

		# Now we'll check to see if the computer can win diagonally.

		if tookTurn == false
			n = 0
			i = 1
			while i <= 9
				if @@board[i] == "O"
					n += 1
				end
				i += 4
			end
			if n == 2
				if @@board[1] != "O" && @@board[1] != "X"
					@@board[1] = "O"
					tookTurn = true
				elsif @@board[5] != "O" && @@board[5] != "X"
					@@board[5] = "O"
					tookTurn = true
				elsif @@board[9] != "O" && @@board[9] != "X"
					@@board[9] = "O"
					tookTurn = true
				else
				end
			end
		end

		if tookTurn == false
			n = 0
			i = 3
			while i <= 7
				if @@board[i] == "O"
					n += 1
				end
				i += 2
			end
			if n == 2
				if @@board[3] != "O" && @@board[3] != "X"
					@@board[3] = "O"
					tookTurn = true
				elsif @@board[5] != "O" && @@board[5] != "X"
					@@board[5] = "O"
					tookTurn = true
				elsif @@board[7] != "O" && @@board[7] != "X"
					@@board[7] = "O"
					tookTurn = true
				else
				end
			end
		end

		# If the computer has no chance at winning on its turn, it will move
		# on to the next strategy: it'll check to see if the player is about
		# to win, and if so, attempt to cut them off.

		# check for horizontal dangers:
		i = 1	
		n = 0

		while i < 9 && n < 2 && tookTurn == false
			n = 0
			j = 0
			while j < 3
				if @@board[i + j] == "X"
					n += 1
				end
				j += 1
			end

			if n == 2	# if a danger is detected (2 "X"s on a row), it'll cut
						# off the player.
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
				end

			end

			i += 3
		end

		# now, we'll check for vertical dangers.
		n = 0
		i = 1
		while i < 4 && n < 2 && tookTurn == false
		# the tookTurn check is to ensure the program does not take two turns
			n = 0
			j = 0
			while j <= 9
				if @@board[i + j] == "X"
					n += 1
				end
				j += 3
			end

			if n == 2
				if @@board[i] != "O" && @@board[i] != "X"
					@@board[i] = "O"
					tookTurn = true
				elsif @@board[i+3] != "O" && @@board[i+3] != "X"
					@@board[i+3] = "O"
					tookTurn = true
				elsif @@board[i+6] != "O" && @@board[i+6] != "X"
					@@board[i+6] = "O"
					tookTurn = true
				else
				end

			end

			i += 1
		end

		# now, we'll check for diagonal dangers.
		if tookTurn == false
			n = 0
			i = 1
			while i <= 9
				if @@board[i] == "X"
					n += 1
				end
				i += 4
			end
			if n == 2
				if @@board[1] != "O" && @@board[1] != "X"
					@@board[1] = "O"
					tookTurn = true
				elsif @@board[5] != "O" && @@board[5] != "X"
					@@board[5] = "O"
					tookTurn = true
				elsif @@board[9] != "O" && @@board[9] != "X"
					@@board[9] = "O"
					tookTurn = true
				else
				end
			end
		end

		if tookTurn == false
			n = 0
			i = 3
			while i <= 7
				if @@board[i] == "X"
					n += 1
				end
				i += 2
			end
			if n == 2
				if @@board[3] != "O" && @@board[3] != "X"
					@@board[3] = "O"
					tookTurn = true
				elsif @@board[5] != "O" && @@board[5] != "X"
					@@board[5] = "O"
					tookTurn = true
				elsif @@board[7] != "O" && @@board[7] != "X"
					@@board[7] = "O"
					tookTurn = true
				else
				end
			end
		end
		
		# Finally, if a turn hasn't been taken yet, the program will just
		# fill a random square.

		if tookTurn == false
			i = 1
			while i < 9
				if @@board[i] != "O" && @@board[i] != "X"
					unused << @@board[i]
				end
				i += 1
			end

			@@board[myAtoI(unused.sample)] = "O"
			tookTurn = true
		end

		if tookTurn
			@@used += 1
		end

		printBoard
	end

	# go is where the game loop happens.
	def go
		while input != "q"
			if @@turn == 0
				input = gets.chomp
				if input.ord >= 49 && input.ord <= 57
					if isThisBoxAvailable(myAtoI(input))
						@@board[myAtoI(input)] = "X"
						@@used += 1
						printBoard

						# there could only possibly be a winner if 5 or more
						# squares were used, so we'll check for winners
						# at that point.
						if @@used >= 5 && thereIsAWinner
							if @@winner == "X"
								puts "Congratulations, you win!"
								return true
							elsif @@winner == "O"
								puts "I win!"
								return true
							else
								puts "Unfortunately, there was an unexpected problem."
								return false
							end
						elsif @@used >= 9
							puts "It's a draw game..."
							return true
						else
						end
						
						computerTurn
							
					else
						puts "Hey, that square is already taken! Try another one."
					end
				else
					puts "Hey, I don't recognize that input. Try again!"
				end
			
			elsif @@turn == 1
				computerTurn
			end
		end
	end
end

def playTicTacToe

	game = TicTacToe.new

	puts "\nLet's play Tic Tac Toe!\nYou will be X, and I will be O."
	game.printBoard
	puts "\nYou go first. Enter the number of the box\nyou want to place your X. Enter 'q' to quit."

	game.reset
	game.go

end

