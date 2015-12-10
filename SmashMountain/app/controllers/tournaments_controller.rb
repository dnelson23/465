class TournamentsController < ApplicationController
    require 'uri'
    include ChallongeApi

    def upload

    end

    def new
        tournament = params[:tournament_sub] + "-" + params[:tournament_name]
        @allSmashers = Smasher.all
        
        @tournament = JSON.parse(getTournament tournament)
        @tournament = @tournament["tournament"]
        @smashers = @tournament["participants"]
        @matches = @tournament["matches"]
    end

    def create
        thisTournament = Tournament.find_or_initialize_by(challonge_id: params[:tournament_id])
        if thisTournament.persisted?
            flash[:danger] = "Tournament is already in the database"
            redirect_to :back
        end
        thisTournament.name = params[:tournament_name]
        thisTournament.save

        smashersParams = params[:smashers]
        matchesParams = params[:matches]

        smashers = Array.new
        matches = Array.new

        smashersParams.each do |smasher|
            thisSmasher = Smasher.find_or_create_by!(tag: smasher["name"])
            smashers.push({ "challonge_id" => smasher["id"], "smasherObj" => thisSmasher })
        end

        matchesParams.each do |match|
            thisMatch = Match.new
            thisMatch.tournament_id = thisTournament.id
            smashers.each do |smasher|
                if smasher["challonge_id"] == match["winner_id"]
                    thisMatch.winner_id = smasher["smasherObj"].id
                elsif smasher["challonge_id"] == match["loser_id"]
                    thisMatch.loser_id = smasher["smasherObj"].id
                end
            end
            thisMatch.save
        end
    end
end