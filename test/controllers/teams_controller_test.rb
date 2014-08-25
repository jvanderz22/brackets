require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  setup do
    @team = teams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team" do
    assert_difference('Team.count') do
      post :create, team: { bench_minutes: @team.bench_minutes, def_2_point_dist: @team.def_2_point_dist, def_3_point_dist: @team.def_3_point_dist, def_3pa_per_fga: @team.def_3pa_per_fga, def_assist_rate: @team.def_assist_rate, def_block_pct: @team.def_block_pct, def_eff: @team.def_eff, def_efg: @team.def_efg, def_ft_pct: @team.def_ft_pct, def_ft_point_dist: @team.def_ft_point_dist, def_fta_rate: @team.def_fta_rate, def_reb: @team.def_reb, def_three_point_pct: @team.def_three_point_pct, def_turnover: @team.def_turnover, def_two_point_pct: @team.def_two_point_pct, effective_height: @team.effective_height, experience: @team.experience, off_2_point_dist: @team.off_2_point_dist, off_3_point_dist: @team.off_3_point_dist, off_3pa_per_fga: @team.off_3pa_per_fga, off_assist_rate: @team.off_assist_rate, off_block_pct: @team.off_block_pct, off_eff: @team.off_eff, off_efg: @team.off_efg, off_ft_pct: @team.off_ft_pct, off_ft_point_dist: @team.off_ft_point_dist, off_fta_rate: @team.off_fta_rate, off_reb: @team.off_reb, off_steal_pct: @team.off_steal_pct, off_three_point_pct: @team.off_three_point_pct, off_turnover: @team.off_turnover, off_two_point_pct: @team.off_two_point_pct, pos: @team.pos, school: @team.school, seed: @team.seed, sos: @team.sos, tempo: @team.tempo }
    end

    assert_redirected_to team_path(assigns(:team))
  end

  test "should show team" do
    get :show, id: @team
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team
    assert_response :success
  end

  test "should update team" do
    patch :update, id: @team, team: { bench_minutes: @team.bench_minutes, def_2_point_dist: @team.def_2_point_dist, def_3_point_dist: @team.def_3_point_dist, def_3pa_per_fga: @team.def_3pa_per_fga, def_assist_rate: @team.def_assist_rate, def_block_pct: @team.def_block_pct, def_eff: @team.def_eff, def_efg: @team.def_efg, def_ft_pct: @team.def_ft_pct, def_ft_point_dist: @team.def_ft_point_dist, def_fta_rate: @team.def_fta_rate, def_reb: @team.def_reb, def_three_point_pct: @team.def_three_point_pct, def_turnover: @team.def_turnover, def_two_point_pct: @team.def_two_point_pct, effective_height: @team.effective_height, experience: @team.experience, off_2_point_dist: @team.off_2_point_dist, off_3_point_dist: @team.off_3_point_dist, off_3pa_per_fga: @team.off_3pa_per_fga, off_assist_rate: @team.off_assist_rate, off_block_pct: @team.off_block_pct, off_eff: @team.off_eff, off_efg: @team.off_efg, off_ft_pct: @team.off_ft_pct, off_ft_point_dist: @team.off_ft_point_dist, off_fta_rate: @team.off_fta_rate, off_reb: @team.off_reb, off_steal_pct: @team.off_steal_pct, off_three_point_pct: @team.off_three_point_pct, off_turnover: @team.off_turnover, off_two_point_pct: @team.off_two_point_pct, pos: @team.pos, school: @team.school, seed: @team.seed, sos: @team.sos, tempo: @team.tempo }
    assert_redirected_to team_path(assigns(:team))
  end

  test "should destroy team" do
    assert_difference('Team.count', -1) do
      delete :destroy, id: @team
    end

    assert_redirected_to teams_path
  end
end
