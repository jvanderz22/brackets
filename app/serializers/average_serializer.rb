class AverageSerializer < ActiveModel::Serializer
  attributes :id, :eff, :tempo, :efg, :turnover, :reb, :fta_rate, :three_point_pct, :two_point_pct, :ft_pct, :block_pct, :steal_pct, :three_pa_per_fga, :assist_rate, :three_point_dist, :two_point_dist, :ft_point_dist, :sos, :bench_minutes, :experience, :effective_height
end
