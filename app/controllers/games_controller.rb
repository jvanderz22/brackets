class GamesController < ApplicationController
  require 'hash_uniq_game_id'
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_filter :set_default_response_format

  # GET /games
  # GET /games.json

  def index
    @games = Game.all
    respond_to do |format|
      format.html { render json: @games }
      format.json { render json: @games }
    end

  end

  # GET /games/1
  # GET /games/1.json
  def show
    respond_to do |format|
      format.html { render json: @game }
      format.json { render json: @game }
    end
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        if  @game.winner_id == game_params["winner_id"]
          format.html { redirect_to @game, notice: 'Game was successfully updated.' }
          format.json { render json: @game, status: :ok, location: @game }
        else
          update_records(@game, game_params)
          format.json { render json: @game, status: :created, location: @game }
        end
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:id, :uniq_game_id, :bracket_id, :bracket_game_id, :teams, :winner_id, :in_bracket)
    end

    def set_default_response_format
      request.format = :json
    end


    def update_records(game, game_params)
      next_game_uniq_id = next_game_uniq_id(game.bracket_id,
                                            game.bracket_game_id)
      next_game = Game.find_by(uniq_game_id: next_game_uniq_id)
      team =  Team.find(game_params["winner_id"])
      updated_team = updated_winning_team(team, game, next_game.id)
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
