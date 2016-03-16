require 'kenpom_config'

KenpomConfig.config = YAML.load_file("config/kenpom.yml")[Rails.env].symbolize_keys
