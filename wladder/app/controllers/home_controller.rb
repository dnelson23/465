class HomeController < ApplicationController
	load "#{Rails.root}/lib/ladder.rb"

	def index
		prng = Random.new
		@word1 = dictionary[prng.rand(dictionary.length)]
		@goalword = dictionary[prng.rand(dictionary.length)]
	end

	def check
		@startWord = params['start_word']
		@goalWord = params['goal_word']
		@words = [ @startWord,
			  @goalWord,
			  params['step1'], 
		      	  params['step2'], 
		          params['step3'], 
		          params['step4'], 
		          params['step5'] ]
		checkWords = @words.reject{ |word| word.empty? }
		@didWin = legal checkWords
	end
end
