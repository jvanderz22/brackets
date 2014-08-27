require 'json'

class Averages
  attr_reader :data

  def initialize(uri)
    @uri = uri
    @data = {}
    @email = 'jvanderz@umich.edu'
    @password = 'wolverines123'
    @driver = Selenium::WebDriver.for :firefox
  end

  def scrape
    sign_in
    set_averages_data
    write_to_file("ncaa_averages.json")
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

  def set_averages_data
    @driver.find_element(:link_text, "Florida").click
    page_data = @driver.page_source
    @data = averages_data(page_data)
  end

  def averages_data(data_string)
    {
      eff: data_value(data_string, "effText", 3),
      tempo: data_value(data_string, "tempoText", 2),
      efg: data_value(data_string, "Effective FG%:", 3),
      turnover: data_value(data_string, "Turnover %:", 3),
      reb: data_value(data_string, "Off. Reb. %:", 3),
      fta_rate: data_value(data_string, "FTA/FGA:", 3),
      three_point_pct: data_value(data_string, "3P%", 3),
      two_point_pct: data_value(data_string, "2P%", 3),
      ft_pct: data_value(data_string, "FT%:", 3),
      block_pct: data_value(data_string, "Block%:", 3),
      steal_pct: data_value(data_string, "Steal%:", 3),
      three_pa_per_fga: data_value(data_string, "3PA/FGA:", 3),
      assist_rate: data_value(data_string, "A/FGM:", 3),
      three_point_dist: data_value(data_string, "3-Pointers:", 3),
      two_point_dist: data_value(data_string, "2-Pointers:", 3),
      ft_point_dist: data_value(data_string, "Free Throws:", 3),
      sos: data_value(data_string, "Overall:", 2),
      bench_minutes: data_value(data_string, "Bench Minutes:", 2),
      experience: data_value(data_string, "Experience:", 2),
      effective_height: data_value(data_string, "Effective Height", 2)
    }
  end

  def data_value(data_string, element_label, td_num)
    element_pos = data_string.index(element_label)
    trimmed_string = data_string[element_pos, 600]
    trimmed_string.split("<td")[td_num].match(/((\+*)(-*)(\d*)\.(\d+))/)[0]
  end

end
