require "pry"
# Write your code here!
def game_hash
  # game_hash =
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks:5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def home_team?(player)
  game_hash[:home][:players].keys.include?(player)
end

def num_points_scored(player)
  if home_team?(player)
    game_hash[:home][:players][player][:points]
  else
    game_hash[:away][:players][player][:points]
  end
end

def shoe_size(player)
  if home_team?(player)
    game_hash[:home][:players][player][:shoe]
  else
    game_hash[:away][:players][player][:shoe]
  end
end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    game_hash[:home][:colors]
  else
    game_hash[:away][:colors]
  end
end

def team_names
  teams = []
  teams << game_hash[:home][:team_name]
  teams << game_hash[:home][:team_name]
  teams
end

def player_numbers(team_name)
  player_nums = []
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:players].each do |name,stats|
      player_nums << stats[:number]
    end
  else
    game_hash[:away][:players].each do |name,stats|
      player_nums << stats[:number]
    end
  end
  player_nums
end

def player_stats(player)
  if home_team?(player)
    game_hash[:home][:players][player]
  else
    game_hash[:away][:players][player]
  end
end

# def big_shoe_rebounds
#   largest_stats = nil
#   game_hash[:home][:players].each do |name, stats|
#     if largest_stats == nil
#       largest_stats = stats
#     else
#       largest_stats = stats if stats[:shoe] > largest_stats[:shoe]
#     end
#   end
#   game_hash[:away][:players].each do |name, stats|
#     if largest_stats == nil
#       largest_stats = stats
#     else
#       largest_stats = stats if stats[:shoe] > largest_stats[:shoe]
#     end
#   end
#
#   largest_stats[:rebounds]
# end

def big_shoe_rebounds
  largest_stats = nil
  game_hash.each do |home_or_away, team|
    team[:players].each do |name, stats|
      if largest_stats == nil || stats[:shoe] > largest_stats[:shoe]
        largest_stats = stats
      end
    end
  end
  largest_stats[:rebounds]
end
#should have used this method vs checking for home or away.

def most_points_scored
  most_points = nil
  most_pts_name = nil
  game_hash.each do |home_or_away, team|
    team[:players].each do |name, stats|
      if most_points == nil || stats[:points] > most_points[:points]
        most_points = stats
        most_pts_name = name
      end
    end
  end
  most_pts_name
end


def winning_team
  total_points = 0
  winner = ""
  game_hash.each do |home_or_away, team|
    current_team_points = 0
    team[:players].each do |name, stats|
      current_team_points += stats[:points]
    end

    if current_team_points > total_points
      total_points = current_team_points
      winner = team[:team_name]
    end
  end
  winner
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |home_or_away, team|
    team[:players].each do |name, stats|
      longest_name = name if name.length > longest_name.length
    end
  end
  longest_name
end

def player_with_most_steals
  most_steals = 0
  most_steals_player = ""
  game_hash.each do |home_or_away, team|
    team[:players].each do |name, stats|
      if stats[:steals] > most_steals
        most_steals = stats[:steals]
        most_steals_player = name
      end
    end
  end
  most_steals_player
end

def long_name_steals_a_ton?
  player_with_longest_name == player_with_most_steals
end
