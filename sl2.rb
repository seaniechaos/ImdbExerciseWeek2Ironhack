# SL2. I’m damn right about TV series!

# I love TV series. I hope you do too. One of the main topics about TV series is The Absolute Truth Answers, which everyone thinks
# he has but no one truly does.

# Is Lost Finale as shitty as everyone says? Is The Wire the best TV series ever, or is it Breaking Bad? WHY WAS FIREFLY CANCELLED?
# Is it true that whoever wrote Heroes season 3 was the Devil himself? Why is Community so underrated, being in fact the best comedy ever?

# Write a class, let’s say SeriesMasterOfTheUniverse, with several methods answering questions about the series universe. Try to add
# parameters to most questions: there is no point in testing constants! Then add the testing for it using RSpec. Write several tests
# for each question, exploring different scenarios.

# An example of a method is one that, when passing a list of some TV series, returns the best one. For instance, when prefering The Wire
# when comparing it to Friends, it should pass the test. Otherwise, if it returns Mom as the best comedy aired on 2013, it should fail
# (I mean, Veep or Community were definitely better).

# Upgrade: use IMDB Ruby gem to remove arbitrarity!

require 'imdb'

class Series
	attr_reader :rating, :title
	def initialize(title)
		@title = title
		# @rating = (1..10).to_a.sample
		@rating = Imdb::Search.new(title).movies.first.rating
	end
end

class Calculator
	def ratings_system(first_series, second_series)
		if first_series.rating > second_series.rating
			puts "#{first_series.title} beats #{second_series.title} by #{first_series.rating.to_f - second_series.rating.to_f} points!"
		else
			puts "#{second_series.title} beats #{first_series.title} by #{second_series.rating.to_f - first_series.rating.to_f} points!"
		end
	end
end

def question_list
	puts "*"*60
	puts "Let's compare two series."
	puts "*"*60

	puts "What is the name of the first series you'd like to look at?"
	first_user_input = gets.chomp
	first_series = Series.new(first_user_input)
	puts "*"*60

	puts "And what is the name of the second series?"
	second_user_input = gets.chomp
	second_series = Series.new(second_user_input)
	puts "*"*60
	
	puts "#{first_series.title} has a rating of #{first_series.rating}."
	puts "#{second_series.title} has a rating of #{second_series.rating}."
	Calculator.new.ratings_system(first_series, second_series)
	puts "*"*60
end

question_list







