require 'json'
require 'kenpom_config'

class TeamData
  attr_reader :data

  def initialize(uri)
    @uri = uri
    @data = {}
    @teams = JSON.parse(IO.read("#{Rails.root}/lib/team_data/bracket_info.json"))
    @email = KenpomConfig.config[:email]
    @password = KenpomConfig.config[:password]
    @driver = Selenium::WebDriver.for :chrome
  end

  def scrape
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
    @driver.navigate.to(@uri)
    @driver.find_element(:name, "email").send_keys(@email)
    @driver.find_element(:name, "password").send_keys(@password)
    @driver.find_element(:name, "submit").click
  end

  def get_teams_data
    length = @teams.length
    @teams.each_with_index do |team, index|
      puts "Starting team #{index + 1} of #{length}"
      begin
        navigate_home
        navigate_to_team(team["school"])
        @data[team["school"]] = team.merge(team_data(team["school"]))
        # ughhhh
        @team_data_string = nil
        puts @data[team["school"]]['school']
      rescue Errno::EAGAIN
        puts "Error Rescued"
        retry
      end
    end
  end

  def team_data_string
    @team_data_string ||= @driver.page_source
  end

  def team_data(team_name)
    {
      off_eff: match_value("RankAdjOE"),
      off_eff_rank: match_rank('RankAdjOE'),
      def_eff: match_value("RankAdjDE"),
      def_eff_rank: match_rank('RankAdjDE'),
      tempo: match_value("RankAdjTempo"),
      off_efg: match_value("RankeFG_Pct"),
      off_efg_rank: match_rank("RankeFG_Pct"),
      def_efg: match_value("RankDeFG_Pct"),
      def_efg_rank: match_rank("RankDeFG_Pct"),
      off_turnover: match_value("RankTO_Pct"),
      off_turnover_rank: match_rank("RankTO_Pct"),
      def_turnover: match_value("RankDTO_Pct"),
      def_turnover_rank: match_rank("RankDTO_Pct"),
      off_reb: match_value("RankOR_Pct"),
      off_reb_rank: match_rank("RankOR_Pct"),
      def_reb: match_value("RankDOR_Pct"),
      def_reb_rank: match_rank("RankDOR_Pct"),
      off_fta_rate: match_value("RankFT_Rate"),
      off_fta_rate_rank: match_rank("RankFT_Rate"),
      def_fta_rate: match_value("RankDFT_Rate"),
      def_fta_rate_rank: match_rank("RankDFT_Rate"),
      off_three_point_pct: match_value("RankFG3Pct"),
      off_three_point_pct_rank: match_rank("RankFG3Pct"),
      def_three_point_pct: match_value("RankFG3Pct&amp;od=d"),
      def_three_point_pct_rank: match_rank("RankFG3Pct&amp;od=d"),
      off_two_point_pct: match_value("RankFG2Pct"),
      off_two_point_pct_rank: match_rank("RankFG2Pct"),
      def_two_point_pct: match_value("RankFG2Pct&amp;od=d"),
      def_two_point_pct_rank: match_rank("RankFG2Pct&amp;od=d"),
      off_ft_pct: match_value("RankFTPct"),
      off_ft_pct_rank: match_rank("RankFTPct"),
      def_ft_pct: match_value("RankFTPct&amp;od=d"),
      def_ft_pct_rank: match_rank("RankFTPct&amp;od=d"),
      off_block_pct: match_value("RankBlockPct"),
      off_block_pct_rank: match_rank("RankBlockPct"),
      def_block_pct: match_value("RankBlockPct&amp;od=d"),
      def_block_pct_rank: match_rank("RankBlockPct&amp;od=d"),
      off_steal_pct: match_value("RankStlRate"),
      off_steal_pct_rank: match_rank("RankStlRate"),
      def_steal_pct: match_value("RankStlRate&amp;od=d"),
      def_steal_pct_rank: match_rank("RankStlRate&amp;od=d"),
      off_3pa_per_fga: match_value("RankF3GRate"),
      off_3pa_per_fga_rank: match_rank("RankF3GRate"),
      def_3pa_per_fga: match_value("RankF3GRate&amp;od=d"),
      def_3pa_per_fga_rank: match_rank("RankF3GRate&amp;od=d"),
      off_assist_rate: match_value("RankARate"),
      off_assist_rate_rank: match_rank("RankARate"),
      def_assist_rate: match_value("RankARate&amp;od=d"),
      def_assist_rate_rank: match_rank("RankARate&amp;od=d"),
      off_3_point_dist: match_value("RankOff_3"),
      off_3_point_dist_rank: match_rank("RankOff_3"),
      def_3_point_dist: match_value("RankDef_3"),
      def_3_point_dist_rank: match_rank("RankDef_3"),
      off_2_point_dist: match_value("RankOff_2"),
      off_2_point_dist_rank: match_rank("RankOff_2"),
      def_2_point_dist: match_value("RankDef_2"),
      def_2_point_dist_rank: match_rank("RankDef_2"),
      off_ft_point_dist: match_value("RankOff_1"),
      off_ft_point_dist_rank: match_rank("RankOff_1"),
      def_ft_point_dist: match_value("RankDef_1"),
      def_ft_point_dist_rank: match_rank("RankDef_1"),
      sos: find_num_in_HTML("RankSOSPythag"),
      sos_rank: match_rank_in_HTML("RankSOSPythag"),
      bench_minutes: find_num_in_HTML("BenchRank"),
      bench_minutes_rank: match_rank_in_HTML("BenchRank"),
      experience: find_num_in_HTML("ExpRank"),
      experience_rank: match_rank_in_HTML("ExpRank"),
    }
  end

  def navigate_home
    @driver.find_element(:css, 'a[href="/"]').click
  end

  def navigate_to_team(team_name)
    tries ||= 3
    @driver.find_element(:link_text, team_name).click
  rescue
    puts "#{team_name} not found"
    retry if tries -= 1 > 0
    @driver.save_screenshot('scraper_error.png')
    raise "Team #{team_name} not found"
  end

  def match_regex(category)
    Regexp.new("=#{category}\\\\\\\"&gt;([0-9]+\\.*[0-9]*)&lt;")
  end

  def match_value(match_string)
    team_data_string.split("function tableStart()")[-1].match(match_regex(match_string))[1]
  rescue
    raise "Data not found for #{match_string}"
  end

  def rank_regex(category)
    Regexp.new(/=#{category}.*?seed\\\"&gt;\d*/m)
  end

  def match_rank(match_string)
    whole_season_data_string = team_data_string.split("function tableStart()")[-1]
    matched_data = whole_season_data_string.match(rank_regex(match_string)).to_s
    matched_data.match(/seed.*/).to_s.match(/(\d+)/).to_s
  rescue
    raise "Rank not found for #{match_string}"
  end

  def match_rank_in_HTML(match_string)
    length = match_string.length
    data_pos = team_data_string.index(match_string)
    team_data_string[data_pos, length + 50].match(/seed.*/).to_s.match(/(\d+)/).to_s
  rescue
    if (tries -= 1).zero?
      raise "Data not found for #{match_string}"
    else
      @team_data_string ||= @driver.page_source
      retry
    end
  end

  def find_num_in_HTML(match_string)
    tries ||= 2
    length = match_string.length
    data_pos = team_data_string.index(match_string)
    puts "found num in html at: #{data_pos}"
    team_data_string[data_pos, length + 10].match(/((\+*)(-*)(\d*)\.(\d+))/)[0]
  rescue
    if (tries -= 1).zero?
      raise "Data not found for #{match_string}"
    else
      @team_data_string = @driver.page_source
      retry
    end
  end
end
