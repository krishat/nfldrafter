task :simulate => :environment do
	Ownership.all.each do |ownership|
		ownership.acquire(Ownership.players_with_no_ownership.sample).save
	end
end
