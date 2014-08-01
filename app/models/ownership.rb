class Ownership < ActiveRecord::Base
	belongs_to :team
	belongs_to :player

	validates :round, :pick_no, :team, presence: true

	def self.get_all_ownerships
		 includes(:team, :player)
	end

	def acquire(player)
		self.player = player
	end

	def self.latest_three_picks
		Ownership.joins(:player).order('updated_at ASC').last(3)
	end

	def self.players_with_no_ownership
		player_acquired_arr = []
		player_acquired = Ownership.where("player_id IS NOT NULL").select{|f| player_acquired_arr << f.player_id}
		all_player_id = Player.pluck(:id)
		final_players_not_qcquired = all_player_id - player_acquired_arr
		Player.order("name").find(final_players_not_qcquired)
	end

end
