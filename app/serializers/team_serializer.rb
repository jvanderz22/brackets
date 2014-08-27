class TeamSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :pos, :seed, :school, :game_id, :off_eff, :def_eff, :tempo, :off_efg, :def_efg, :off_turnover, :def_turnover, :off_reb, :def_reb, :off_fta_rate, :def_fta_rate, :off_three_point_pct, :def_three_point_pct, :off_two_point_pct, :def_two_point_pct, :off_ft_pct, :def_ft_pct, :off_block_pct, :def_block_pct, :off_steal_pct, :def_steal_pct, :off_3pa_per_fga, :def_3pa_per_fga, :off_assist_rate, :def_assist_rate, :off_3_point_dist, :def_3_point_dist, :off_2_point_dist, :def_2_point_dist, :off_ft_point_dist, :def_ft_point_dist, :sos, :bench_minutes, :experience, :effective_height
  has_many :games
end