class GamesController < BaseController
  require 'hash_uniq_game_id'

  def update
    if get_resource.update(resource_params)
      update_records(resource_params) unless get_resource.winner_id == resource_params["winner_id"]
      set_additional_show_resources
      render :show
    else
      render json: get_resource.errors, status: :unprocessable_entity
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:game).permit(:id, :uniq_game_id, :bracket_id, :bracket_game_id, :teams, :winner_id, :in_bracket)
    end

    def set_additional_index_resources
      @teams = Team.all
      @averages = Average.first
    end

    def set_additional_show_resources
      @teams = @game.team_ids.map { |team_id| Team.find(team_id) }
      @teams.push(Team.find(@game.winner_id))
    end

    def update_records(game_params)
      next_game_uniq_id = next_game_uniq_id(@game.bracket_id,
                                            @game.bracket_game_id)
      next_game = Game.find_by(uniq_game_id: next_game_uniq_id)
      team =  Team.find(game_params["winner_id"])
      updated_team = updated_winning_team(team, @game, next_game.id)
      update_next_game(next_game, updated_team)
    end

    def update_next_game(next_game, team)
      next_game.teams << team
      next_game.save
    end

    def updated_winning_team(team, game_won, next_game_id)
      team.games << game_won
      team.game_id = next_game_id
      team.save
      team
    end

    def next_game_uniq_id(cur_bracket_id, cur_game_id)
      next_bracket_id = next_bracket_id(cur_bracket_id, cur_game_id)
      next_game_id = next_game_id(cur_bracket_id, cur_game_id)
      HashUniqGameId::hash_game_id(next_bracket_id, next_game_id)
    end

    def next_bracket_id(cur_bracket_num, cur_game_num)
      cur_game_num == 30 ? 4 : cur_bracket_num
    end

    def next_game_id(cur_bracket_num, cur_game_num)
      if cur_game_num == 30
        cur_bracket_num < 2 ? 0 : 1
      else
        cur_bracket_num == 4 ? 2 : (cur_game_num / 2) + 16
      end
    end
end
