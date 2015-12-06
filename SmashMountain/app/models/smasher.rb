class Smasher < ActiveRecord::Base
    has_many :wins, :class_name => "Match", :foreign_key => "winner_id"
    has_many :loses, :class_name => "Match", :foreign_key => "loser_id"
    has_many :tournaments, through: :matches
end