class SysadminController < ApplicationController
  def index

    @order_by_round = params[:indx] ? params[:indx] : 1
    @leftout_players = Player.not_acquired
    
    if @order_by_round
      @owned = Ownership.includes(:team, :player).where(round: @order_by_round)
    else
      @owned = Ownership.includes(:team, :player)
    end

  end

  def accquire
    
    @ownership = Ownership.find_by_pick_no(params[:id])
    @player = Player.find(params[:player][:player_id])
    
    if @ownership.acquire(@player).save
      redirect_to :back, notice: "Player acquired."
    else
      redirect_to :back, notice: "Player acquire failed."
    end

  end

  private
  def acquire_params
    
    params.require(:player).permit(:player_id)
    
  end

end
