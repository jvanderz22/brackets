class TeamsController < BaseController
  http_basic_authenticate_with name: "admin", password: "password", except: [:index, :show ]

  private

  def set_additional_index_resources
    @games = Game.all
  end

  def set_additional_show_resources
    @games = @team.game_ids.map do |game_id|
      Game.find(game_id)
    end.push(Game.find(@team.game_id))
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def resource_params
    params.require(:team).permit(:pos,
                                 :seed,
                                  :school,
                                  :off_eff,
                                  :off_eff_rank,
                                  :def_eff,
                                  :def_eff_rank,
                                  :tempo,
                                  :tempo_rank,
                                  :off_efg,
                                  :off_efg_rank,
                                  :def_efg,
                                  :def_efg_rank,
                                  :off_turnover,
                                  :off_turnover_rank,
                                  :def_turnover,
                                  :def_turnover_rank,
                                  :off_reb,
                                  :off_reb_rank,
                                  :def_reb,
                                  :def_reb_rank,
                                  :off_fta_rate,
                                  :off_fta_rate_rank,
                                  :def_fta_rate,
                                  :def_fta_rate_rank,
                                  :off_three_point_pct,
                                  :off_three_point_pct_rank,
                                  :def_three_point_pct,
                                  :def_three_point_pct_rank,
                                  :off_two_point_pct,
                                  :off_two_point_pct_rank,
                                  :def_two_point_pct,
                                  :def_two_point_pct_rank,
                                  :off_ft_pct,
                                  :off_ft_pct_rank,
                                  :def_ft_pct,
                                  :def_ft_pct_rank,
                                  :off_block_pct,
                                  :off_block_pct_rank,
                                  :def_block_pct,
                                  :def_block_pct_rank,
                                  :off_steal_pct,
                                  :off_steal_pct_rank,
                                  :off_3pa_per_fga,
                                  :off_3pa_per_fga_rate,
                                  :def_3pa_per_fga,
                                  :def_3pa_per_fga_rank,
                                  :off_assist_rate,
                                  :off_assist_rate_rank,
                                  :def_assist_rate,
                                  :def_assist_rate_rank,
                                  :off_3_point_dist,
                                  :off_3_point_dist_rank,
                                  :def_3_point_dist,
                                  :def_3_point_dist_rank,
                                  :off_2_point_dist,
                                  :off_2_point_dist_rank,
                                  :def_2_point_dist,
                                  :def_2_point_dist_rank,
                                  :off_ft_point_dist,
                                  :off_ft_point_dist_rank,
                                  :def_ft_point_dist,
                                  :def_ft_point_dist_rank,
                                  :sos,
                                  :sos_rank,
                                  :bench_minutes,
                                  :bench_minutes_rank,
                                  :experience,
                                  :experience_rank,
                                  :effective_height,
                                  :effective_height_rank
                                )
  end
end
