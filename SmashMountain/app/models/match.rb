class Match < ActiveRecord::Base
    belongs_to :tournament
    has_one :winner, :class_name => "Smasher"
    has_one :loser, :class_name => "Smasher"
end