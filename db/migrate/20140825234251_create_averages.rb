class CreateAverages < ActiveRecord::Migration
  def change
    create_table :averages do |t|
      t.string :eff
      t.string :tempo
      t.string :efg
      t.string :turnover
      t.string :reb
      t.string :fta_rate
      t.string :three_point_pct
      t.string :two_point_pct
      t.string :ft_pct
      t.string :block_pct
      t.string :steal_pct
      t.string :three_pa_per_fga
      t.string :assist_rate
      t.string :three_point_dist
      t.string :two_point_dist
      t.string :ft_point_dist
      t.string :sos
      t.string :bench_minutes
      t.string :experience
      t.string :effective_height

      t.timestamps
    end
  end
end
