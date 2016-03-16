module KenpomConfig
  def self.config
    @@config ||= {}
  end

  def self.config=(hash)
    @@config = hash
  end
end
