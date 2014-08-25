require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post :create, game: { uniq_game_id: @game.uniq_game_id, bracket_id: @game.bracket_id, bracket_game_id: @game.bracket_game_id, id: @game.id, in_bracket: @game.in_bracket, team_1_id: @game.team_1_id, team_2_id: @game.team_2_id, winner: @game.winner }
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should show game" do
    get :show, id: @game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game
    assert_response :success
  end

  test "should update game" do
    patch :update, id: @game, game: { uniq_game_id: @game.uniq_game_id, bracket_id: @game.bracket_id, bracket_game_id: @game.bracket_game_id, id: @game.id, in_bracket: @game.in_bracket, team_1_id: @game.team_1_id, team_2_id: @game.team_2_id, winner: @game.winner }
    assert_redirected_to game_path(assigns(:game))
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete :destroy, id: @game
    end

    assert_redirected_to games_path
  end
end
