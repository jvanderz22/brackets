require 'uuidtools'

class Game < ActiveRecord::Base
  before_create :randomize_id
  has_many :teams, foreign_key: "game_id"
  belongs_to :team, primary_key: "winner_id"
  validates :uniq_game_id, uniqueness: true

  private

  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while Game.where(id: self.id).exists?
  end
end
