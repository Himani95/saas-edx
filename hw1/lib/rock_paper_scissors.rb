class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end
	# key wins value
	@@rules = { 'R' => 'S', 'S' => 'P', 'P' => 'R'}
	def self.winner(player1, player2)
		unless @@rules.keys.include?(player1[1]) and @@rules.keys.include?(player2[1])
			raise	NoSuchStrategyError, "Strategy must be one of R,P,S"
		end
		if @@rules[player2[1]] == player1[1]
			player2
		else
			player1
		end
	end

	def self.tournament_winner(tournament)
		if tournament[0][0].is_a?(String)
			winner = self.winner(tournament[0], tournament[1])
		else
			winner = self.winner(self.tournament_winner(tournament[0]), self.tournament_winner(tournament[1]))
		end
		winner
	end

end
