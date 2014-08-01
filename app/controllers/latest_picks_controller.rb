class LatestPicksController < ApplicationController
  def index
    @lastest_picks = Ownership.latest_three_picks
    unless @lastest_picks.blank?
      @next_team = Team.where("id > ?", @lastest_picks.last.team_id).order("id ASC").first
      if @next_team.nil?
        @next_team = Team.first
      end
    end
  end
end
