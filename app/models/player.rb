class Player < ActiveRecord::Base
	has_one :ownership

	validates :name, :position, presence: true

	def self.not_acquired
		player_acquired_arr = []
		player_acquired = Ownership.where("player_id IS NOT NULL").select{|f| player_acquired_arr << f.player_id}
		all_player_id = Player.pluck(:id)
		final_players_not_qcquired = all_player_id - player_acquired_arr
		Player.order("name").find(final_players_not_qcquired)
	end

	def self.unique_positions
		 Player.uniq.pluck(:position)
	end

end
