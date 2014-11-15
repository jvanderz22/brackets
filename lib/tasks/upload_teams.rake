require 'hash_uniq_game_id'

namespace :upload do
  desc "Build database from scratch"
  task build: :environment do
    upload_teams
    create_empty_games
    add_teams_to_games
    upload_averages
  end

  desc "Upload scraped teams from json file in /app/assets/collected_data_whole_season.json"
  task upload_teams: :environment do
    upload_teams
  end

  desc "Create the base game database"
  task upload_empty_games: :environment do
    create_empty_games
  end

  desc "Assign each game the right teams"
  task assign_games: :environment do
    add_teams_to_games
  end

  desc "Upload averages to the database"
  task upload_averages: :environment do
    upload_averages
  end
  
  def upload_averages
    file = "#{Rails.root}/app/assets/ncaa_averages.json"
    file_content = File.read(file)
    averages = JSON.parse(file_content)
    Average.create!(averages)
  end

  def upload_teams
    file = "#{Rails.root}/app/assets/collected_data_whole_season.json"
    file_content = File.read(file)
    teams = JSON.parse(file_content)
    teams.each do |name, team|
      Team.create!(team)
    end
  end

  def create_empty_games
    (0..3).each do |bracket_num|
      (0..30).each do |game_num|
        default_in_bracket_status = game_num >= 16 ? true : false
        Game.create!(empty_game(bracket_num, game_num, default_in_bracket_status))
      end
    end
    create_final_four
  end

  def create_final_four
    (0..2).each do |game_num|
      Game.create!(empty_game(4, game_num, true))
    end
  end

  def empty_game(bracket_num, game_num, default_in_bracket_status)
    uniq_game_id = HashUniqGameId::hash_game_id(bracket_num, game_num)
    puts bracket_num
    puts game_num
    puts uniq_game_id
      {
      bracket_id: bracket_num,
      bracket_game_id: game_num,
      uniq_game_id: uniq_game_id,
      teams: [],
      winner_id: nil,
      in_bracket: default_in_bracket_status
    }
  end

  def add_teams_to_games
    teams = Team.all
    teams.each do |team|
      puts team
      add_team_to_game(team)
    end
  end

  def add_team_to_game(team)
    game = Game.find_by(uniq_game_id: uniq_game_id(team[:pos]))
    game.teams << team
    game.in_bracket = true
    game.save
  end

  def uniq_game_id(pos)
    pos_int = pos.gsub(/[^\d]/, '').to_i
    bracket_num = bracket_num(pos_int)
    HashUniqGameId::hash_game_id(bracket_num, game_num(pos, pos_int, bracket_num))
  end

  def bracket_num(pos_int)
    if pos_int <= 16
      bracket_num = 0
    elsif pos_int <= 32
      bracket_num = 1
    elsif pos_int <= 48
      bracket_num = 2
    else
      bracket_num = 3
    end
  end

  def game_num(pos, pos_int, bracket_num)
    pos_int = pos_int - ((bracket_num) * 16)
    if pos.include?("a") || pos.include?("b")
      pos_int - 1
    else
      ((pos_int + 1)/2) + 15
    end
  end
 end
