class GamesController < ApplicationController
  require 'open-uri'
  require "json"
  VOWELS = %w(A E I O U Y)

  def new
    @letters = Array.new(5) { VOWELS.sample }
    @letters += Array.new(5) { (('A'..'Z').to_a - VOWELS).sample }
    @letters.shuffle!
  end
  def score
    @word = params[:word].upcase
    @wordarray = @word.split('').to_a
    @letters = params[:letters]
    @url= "https://wagon-dictionary.herokuapp.com/#{@word}"
    @dictionary = URI.open(@url).read
    api = JSON.parse(@dictionary)
    if((@wordarray.all? {|e| @letters.include?(e)}) == false)
      p @answer = "Sorry but #{@word} can't be build with #{@letters} "
    elsif(api["found"] == true)
      p @answer = "Congratulations! #{@word} is a valid English word!"
    else
      p @answer = "Sorry but #{@word} is not a English word"
    end

  end
end
