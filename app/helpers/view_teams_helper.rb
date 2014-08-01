module ViewTeamsHelper

	def get_team_details(teamid)
		if teamid.blank?
			"No Team Data Found"
		else
			Team.find_by_id(teamid).name
		end
	end

	def get_player_name(playerid)
		if playerid.blank?
			"No Player Accquired Yet"
		else
			Player.find_by_id(playerid).name
		end
	end

	def get_team_division(teamid)
		if teamid.blank?
			"No Team Data Found"
		else
			Team.find_by_id(teamid).division
		end
	end
end
