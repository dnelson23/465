class HomeController < ApplicationController
	load "#{Rails.root}/lib/ladder.rb"

	def index
		prng = Random.new
		@word1 = dictionary[prng.rand(dictionary.length)]
		@goalword = dictionary[prng.rand(dictionary.length)]
	end

	def check
		@startWord = "this is a start word"
		@goalWord = "this is the goal word"
		@words = [ params['step1'], 
		      	  params['step2'], 
		          params['step3'], 
		          params['step4'], 
		          params['step5'] ]

	end
end
