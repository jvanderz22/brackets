class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
 
  http_basic_authenticate_with name: "admin", password: "password", except: [:index, :show ]
  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all

    respond_to do |format|
      binding.pry
      format.html
      format.json { render json: @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @teams = Team.find(params[:id].split(','))
    respond_to do |format|
      format.html
      format.json { render json: @teams }
    end
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
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
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:pos, :seed, :school, :off_eff, :def_eff, :tempo, :off_efg, :def_efg, :off_turnover, :def_turnover, :off_reb, :def_reb, :off_fta_rate, :def_fta_rate, :off_three_point_pct, :def_three_point_pct, :off_two_point_pct, :def_two_point_pct, :off_ft_pct, :def_ft_pct, :off_block_pct, :def_block_pct, :off_steal_pct, :off_3pa_per_fga, :def_3pa_per_fga, :off_assist_rate, :def_assist_rate, :off_3_point_dist, :def_3_point_dist, :off_2_point_dist, :def_2_point_dist, :off_ft_point_dist, :def_ft_point_dist, :sos, :bench_minutes, :experience, :effective_height)
    end
end
