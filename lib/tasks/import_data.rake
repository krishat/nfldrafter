# This is rake task is used to import data from csv files into the database
# CSV files are located in datafiles folder

require 'csv'

namespace :import_data do
	task :players_csv_import => :environment do
		all_players = CSV.new(File.open(Rails.root.join("datafiles/players.csv")), headers: true)
		all_players.each do |player|
			Player.create!(name: player[0], position: player[1])
		end
	end

	task :teams_csv_import => :environment do
		all_teams = CSV.new(File.open(Rails.root.join("datafiles/teams.csv")), headers: true)
		all_teams.each do |team|
			Team.create!(name: team[0].strip, division: team[1])
		end
	end

	task :orders_csv_import => [:teams_csv_import] do
		all_orders = CSV.new(File.open(Rails.root.join("datafiles/order.csv")), headers: true)
		all_orders.each do |order|

			#as the below teams have been abbrevated and to avoid nil entry
			if order[2] == "NY Giants"
				order[2] = "New York Giants"
			elsif order[2] == "NY Jets"
				order[2] = "New York Jets"
			end

			team = Team.find_by(name: order[2])
			#puts team.class
			Ownership.create!(round: order[0], pick_no: order[1], team: team)
		end
	end

	task :all => [:players_csv_import, :teams_csv_import, :orders_csv_import] do
	end

end
