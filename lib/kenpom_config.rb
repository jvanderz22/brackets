module KenpomConfig
  def self.config
    @@config ||= {
      email: ENV['KENPOM_EMAIL'],
      password: ENV['KENPOM_PASSWORD']
    }
  end

  def self.config=(hash)
    @@config = hash
  end
end
