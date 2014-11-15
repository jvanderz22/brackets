class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_filter :set_default_response_format
  http_basic_authenticate_with name: "admin", password: "password", except: [:index, :show ]


  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
    respond_to do |format|
      format.json { render json: @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @teams = Team.find(params[:id].split(','))
    respond_to do |format|
      format.json { render json: @teams }
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_default_response_format
      request.format = :json
    end

  # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:pos, :seed, :school, :off_eff, :off_eff_rank, :def_eff, :def_eff_rank, :tempo, :tempo_rank, :off_efg, :off_efg_rank, :def_efg, :def_efg_rank, :off_turnover, :off_turnover_rank, :def_turnover, :def_turnover_rank, :off_reb, :off_reb_rank, :def_reb, :def_reb_rank, :off_fta_rate, :off_fta_rate_rank, :def_fta_rate, :def_fta_rate_rank, :off_three_point_pct, :off_three_point_pct_rank, :def_three_point_pct, :def_three_point_pct_rank, :off_two_point_pct, :off_two_point_pct_rank, :def_two_point_pct, :def_two_point_pct_rank, :off_ft_pct, :off_ft_pct_rank, :def_ft_pct, :def_ft_pct_rank, :off_block_pct, :off_block_pct_rank, :def_block_pct, :def_block_pct_rank, :off_steal_pct, :off_steal_pct_rank, :off_3pa_per_fga, :off_3pa_per_fga_rate, :def_3pa_per_fga, :def_3pa_per_fga_rank, :off_assist_rate, :off_assist_rate_rank, :def_assist_rate, :def_assist_rate_rank, :off_3_point_dist, :off_3_point_dist_rank, :def_3_point_dist, :def_3_point_dist_rank, :off_2_point_dist, :off_2_point_dist_rank, :def_2_point_dist, :def_2_point_dist_rank, :off_ft_point_dist, :off_ft_point_dist_rank, :def_ft_point_dist, :def_ft_point_dist_rank, :sos, :sos_rank, :bench_minutes, :bench_minutes_rank, :experience, :experience_rank, :effective_height, :effective_height_rank)
    end
end
