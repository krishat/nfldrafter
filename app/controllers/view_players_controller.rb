class ViewPlayersController < ApplicationController
  def index
  
    @leftout_players = Array.new
  	@positions = Player.unique_positions
		
		if params[:position]
			position = params[:position]
			@all_players = Player.not_acquired.map{ |val| @leftout_players << val if val.position == position}
		else
			@all_players = Player.not_acquired.map{ |val| @leftout_players << val if val.position == "QB"}
		end
  end
end
