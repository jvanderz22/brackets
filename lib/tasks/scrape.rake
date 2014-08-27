require 'team_data'
require 'averages'
require 'pry'

namespace :scrape do
  desc "Scrape team data from KenPom"
  task scrape_teams: :environment do
    TeamData.new("http://kenpom.com").scrape
  end

  desc "Scrape NCAA Averages data from KenPom"
  task scrape_averages: :environment do
    Averages.new("http://kenpom.com").scrape
  end
end
