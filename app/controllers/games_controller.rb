class GamesController < ApplicationController
  require 'open-uri'
  require "json"
  def new
    @letters = ('a'..'z').to_a.shuffle[0..9].join(' ').upcase
  end
  def score
    @word = params[:word]
    @url= "https://wagon-dictionary.herokuapp.com/#{@word}"
    @dictionary = URI.open(@url).read
    api = JSON.parse(@dictionary)
    if(api["found"] == true)
      p @answer = "Congratulations! #{@word} is a valid English word!"
    else
      p@answer = "Sorry but #{@word} is not a English word"
    end

    # puts @test = api["found"]
  end
end
