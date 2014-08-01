class ViewTeamsController < ApplicationController
  def index
    @all_teams = Team.all
    @team = Team.find(params[:team_id]) if params[:team_id]
    puts params[:round]
    if params[:round] == "all"
      ids = [*1..7]
    else
      ids = params[:round]
    end

    logger.info "*************************"
    logger.info ids
    logger.info params[:team_id]
    if ids != nil || params[:team_id] != nil
      @team_details = Ownership.where(:round => ids,:team_id => params[:team_id])
      logger.info @team_details
      logger.info @team_details

    end
  end

  def display


  end

end
