require 'imdb'

class SeriesCentral
  def get_results(term)
    Imdb::Search.new(term).movies.size
  end

  def most_seasons(shows)
  	shows.sort do |show1, show2|
  		serie_for(show1).seasons.size <=> serie_for(show2).seasons.size
  	end.last
  end

  def most_episodes(shows)
   	shows.sort do |show1, show2|
		serie_for(show1).seasons.map { |season| season.episodes.size }.inject(:+) <=> serie_for(show2).seasons.map { |season| season.episodes.size }.inject(:+)
  	end.last
  end

  def best_ever(shows)
  	shows.sort do |show1, show2|
  		serie_for(show1).rating <=> serie_for(show2).rating
  end.last
end

  def top_movies(top_number)
  		# rating_hash = {}
  		# counter = 0
  		# 	Imdb::Top250.new.movie.each do |movie|
  		# 		counter +=1
  		# 		rating_hash[movie.title] = movie.rating
  		# 		if counter >= top_number
  		# 			break
  		# 		end
  		# 	end
  		a = [*0 .. top_number - 1]
  		top_rating = Imdb::Top250.new
  		a.map do |item|
  			top_rating.movies[item].title
  		end
  end

  private

  def serie_for(show)
  	movie = Imdb::Search.new(show).movies.first
	serie = Imdb::Serie.new(movie.id)
  end
end