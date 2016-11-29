require 'rest-client'
require 'json'
require 'pry'

def get_character_hash
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  JSON.parse(all_characters)
end

def get_character_movies_from_api(character)
  #make the web request
  films_array = []
  #return_array = []
  #character_hash = get_character_hash
    get_character_hash["results"].each { |character_h|
      if character == character_h["name"].downcase
      films_array = character_h["films"]
    end
    }
    #return_array = films_array.collect { |film_api|
    films_array.collect { |film_api|
      #film_info = RestClient.get(film_api)
      film_hash = JSON.parse(film_info = RestClient.get(film_api))
      #return_array.push(film_hash)
    }
  #   if return_array.length == 0
  #     puts "Character is not found in database."
  # end
  #return_array
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each.with_index(1) { |film, index|
    puts "#{index}. #{film["title"]}"
  }
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
