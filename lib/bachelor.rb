require 'pry'

def get_first_name_of_season_winner(data, season)

  index_of_winner = data[season].find_index do |contestant|
    contestant["status"] == "Winner"
  end
  first_name_of_winner = data[season][index_of_winner]["name"].split[0]

end

def get_contestant_name(data, occupation)
  data.each do |season, season_data|
    index =  season_data.find_index do |contestant|
          contestant["occupation"] == occupation
      end
    if index
      return data[season][index]["name"]
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  # code here
  count = 0
  data.each do |season, season_data|
    count += (season_data.select do |contestant|
      contestant["hometown"] == hometown
    end).length
  end
  count
end

def get_occupation(data, hometown)
  # code here
  data.each do |season, season_data|
    index = season_data.find_index do |contestant|
      contestant["hometown"] == hometown
    end
    if index
      return data[season][index]["occupation"]
    end
  end

end

def get_average_age_for_season(data, season)
  # code here
    age_arr = data[season].map do |contestant|
        contestant["age"]

      end

      age_arr = age_arr.map { |e| e.to_f }

      avg = (age_arr.reduce(:+)/ age_arr.length).round 

end
