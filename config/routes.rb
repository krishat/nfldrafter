Rails.application.routes.draw do

  root 'sysadmin#index'

  get '/sysadmin' => 'sysadmin#index', as: :sysadmin

  put '/sysadmin/:id/getplayer' => 'sysadmin#accquire', as: :acquire_player

  get '/sysadmin/:id' => 'sysadmin#index'

  get '/teams' => 'view_teams#index', as: :teams

  get '/players'  => 'view_players#index', as: :players

  get '/latest_picks' => 'latest_picks#index', as: :latest_picks

end
