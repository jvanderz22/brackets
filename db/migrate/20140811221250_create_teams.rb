class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :pos
      t.string :seed
      t.string :school
      t.string :off_eff
      t.string :def_eff
      t.string :tempo
      t.string :off_efg
      t.string :def_efg
      t.string :off_turnover
      t.string :def_turnover
      t.string :off_reb
      t.string :def_reb
      t.string :off_fta_rate
      t.string :def_fta_rate
      t.string :off_three_point_pct
      t.string :def_three_point_pct
      t.string :off_two_point_pct
      t.string :def_two_point_pct
      t.string :off_ft_pct
      t.string :def_ft_pct
      t.string :off_block_pct
      t.string :def_block_pct
      t.string :off_steal_pct
      t.string :def_steal_pct
      t.string :off_3pa_per_fga
      t.string :def_3pa_per_fga
      t.string :off_assist_rate
      t.string :def_assist_rate
      t.string :off_3_point_dist
      t.string :def_3_point_dist
      t.string :off_2_point_dist
      t.string :def_2_point_dist
      t.string :off_ft_point_dist
      t.string :def_ft_point_dist
      t.string :sos
      t.string :bench_minutes
      t.string :experience
      t.string :effective_height

      t.timestamps
    end
  end
end
