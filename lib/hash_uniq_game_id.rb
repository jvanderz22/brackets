module HashUniqGameId
  def hash_game_id(bracket_num, game_num)
    ((((bracket_num + 1) * 10)**2) +  (bracket_num + 1)) * (game_num + 1)
  end
  module_function :hash_game_id
end
