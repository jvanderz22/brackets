require 'json'

class TeamData
  attr_reader :data

  def initialize(uri)
    @uri = uri
    @data = {}
    @teams = JSON.parse(IO.read("#{Rails.root}/lib/team_data/bracket_info.json"))
    binding.pry
  end

  def scrape
    @driver = Selenium::WebDriver.for :firefox
    sign_in
    get_teams_data
    @driver.quit
    write_to_file("collected_data_whole_season.json")
  end

  private

  def write_to_file(file_name)
    File.open("#{Rails.root}/app/assets/#{file_name}", "w") do |file|
      file.write(@data.to_json)
    end
  end

  def sign_in
    email = "jvanderz@umich.edu"
    password = "wolverines123"
    @driver.navigate.to(@uri)
    @driver.find_element(:name, "email").send_keys(email)
    @driver.find_element(:name, "password").send_keys(password)
    @driver.find_element(:name, "submit").click
  end

  def get_teams_data
    @teams.each do |team|
      navigate_home
      navigate_to_team(team["team"])
      @data[team["team"]] =  team.merge(team_data(team["team"]))
    end
  end

  def team_data_string(team)
    @driver.page_source
  end

  def team_data(team_name)
    team_data_string = team_data_string(team_name)
    {
      off_eff: match_value(team_data_string, "RankAdjOE"),
      def_eff: match_value(team_data_string, "RankAdjDE"),
      tempo: match_value(team_data_string, "RankAdjTempo"),
      off_efg: match_value(team_data_string, "RankeFG_Pct"),
      def_efg: match_value(team_data_string, "RankDeFG_Pct"),
      off_turnover: match_value(team_data_string, "RankTO_Pct"),
      def_turnover: match_value(team_data_string, "RankDTO_Pct"),
      off_reb: match_value(team_data_string, "RankOR_Pct"),
      def_reb: match_value(team_data_string, "RankDOR_Pct"),
      off_fta_rate: match_value(team_data_string, "RankFT_Rate"),
      def_fta_rate: match_value(team_data_string, "RankDFT_Rate"),
      off_three_point_pct: match_value(team_data_string, "RankFG3Pct"),
      def_three_point_pct: match_value(team_data_string, "RankFG3Pct&amp;od=d"),
      off_two_point_pct: match_value(team_data_string, "RankFG2Pct"),
      def_two_point_pct: match_value(team_data_string, "RankFG2Pct&amp;od=d"),
      off_ft_pct: match_value(team_data_string, "RankFTPct"),
      def_ft_pct: match_value(team_data_string, "RankFTPct&amp;od=d"),
      off_block_pct: match_value(team_data_string, "RankBlockPct"),
      def_block_pct: match_value(team_data_string, "RankBlockPct&amp;od=d"),
      off_steal_pct: match_value(team_data_string, "RankStlRate"),
      def_steal_pct: match_value(team_data_string, "RankStlRate&amp;od=d"),
      off_3pa_per_fga: match_value(team_data_string, "RankF3GRate"),
      def_3pa_per_fga: match_value(team_data_string, "RankF3GRate&amp;od=d"),
      off_assist_rate: match_value(team_data_string, "RankARate"),
      def_assist_rate: match_value(team_data_string, "RankARate&amp;od=d"),
      off_3_point_dist: match_value(team_data_string, "RankOff_3"),
      def_3_point_dist: match_value(team_data_string, "RankDef_3"),
      off_2_point_dist: match_value(team_data_string, "RankOff_2"),
      def_2_point_dist: match_value(team_data_string, "RankDef_2"),
      off_ft_point_dist: match_value(team_data_string, "RankOff_1"),
      def_ft_point_dist: match_value(team_data_string, "RankDef_1")
    }
  end

  def navigate_home
    @driver.find_element(:css, 'a[href="."]').click
  end

  def navigate_to_team(team_name)
    begin
     @driver.find_element(:link_text, team_name).click
    rescue
      raise "Team #{team} not found"
    end
  end

  def match_regex(category)
    Regexp.new("=#{category}\\\\\\\"&gt;([0-9]+\\.*[0-9]*)&lt;")
  end

  def match_value(team_data_string, match_string)
    begin
      whole_season_data_string = team_data_string.split("function tableStart()")[-1]
      whole_season_data_string.match(match_regex(match_string))[1]
    rescue
      "Data not found for #{team_data_string}"
    end
  end

end
