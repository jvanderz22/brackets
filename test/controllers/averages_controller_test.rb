require 'test_helper'

class AveragesControllerTest < ActionController::TestCase
  setup do
    @average = averages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:averages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create average" do
    assert_difference('Average.count') do
      post :create, average: { assist_rate: @average.assist_rate, bench_minutes: @average.bench_minutes, block_pct: @average.block_pct, eff: @average.eff, effective_height: @average.effective_height, efg: @average.efg, experience: @average.experience, ft_pct: @average.ft_pct, ft_point_dist: @average.ft_point_dist, fta_rate: @average.fta_rate, reb: @average.reb, sos: @average.sos, steal_pct: @average.steal_pct, three_pa_per_fga: @average.three_pa_per_fga, three_point_dist: @average.three_point_dist, three_point_pct: @average.three_point_pct, turnover: @average.turnover, two_point_dist: @average.two_point_dist, two_point_pct: @average.two_point_pct }
    end

    assert_redirected_to average_path(assigns(:average))
  end

  test "should show average" do
    get :show, id: @average
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @average
    assert_response :success
  end

  test "should update average" do
    patch :update, id: @average, average: { assist_rate: @average.assist_rate, bench_minutes: @average.bench_minutes, block_pct: @average.block_pct, eff: @average.eff, effective_height: @average.effective_height, efg: @average.efg, experience: @average.experience, ft_pct: @average.ft_pct, ft_point_dist: @average.ft_point_dist, fta_rate: @average.fta_rate, reb: @average.reb, sos: @average.sos, steal_pct: @average.steal_pct, three_pa_per_fga: @average.three_pa_per_fga, three_point_dist: @average.three_point_dist, three_point_pct: @average.three_point_pct, turnover: @average.turnover, two_point_dist: @average.two_point_dist, two_point_pct: @average.two_point_pct }
    assert_redirected_to average_path(assigns(:average))
  end

  test "should destroy average" do
    assert_difference('Average.count', -1) do
      delete :destroy, id: @average
    end

    assert_redirected_to averages_path
  end
end
