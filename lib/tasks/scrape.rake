require 'team_data'
require 'pry'

namespace :scrape do
  desc "Scrape team data from KenPom"
  task scrape_data: :environment do
    TeamData.new("http://kenpom.com").scrape
  end
end
