class Team < ActiveRecord::Base
	has_many :ownerships
	has_many :players

	validates :name, :division, presence: true
end
