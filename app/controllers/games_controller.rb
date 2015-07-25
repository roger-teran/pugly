class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    if current_user
      @games = Game.all
    else 
      redirect_to root_path
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @team_a = @game.enrollments
                   .select { |enrollment| enrollment.team == "team_a" }
                   .map &:player
    @team_b = @game.enrollments
                   .select { |enrollment| enrollment.team == "team_b" }
                   .map &:player

    @gamePage = Game.includes(:creator, :players).find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @gamePage.to_json(include: :creator) }
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
      @game.creator_id = current_user.id
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
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
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
      @game = Game.includes(:creator, :players, enrollments: :player).find(params[:id])
      # --> use @organizer in the show.html.erb to render the organizer of the game
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name, :sport, :date, :time, :location, :dynamic, :price, :city, :state, :zip)
    end
end



# <p>Team A:</p>
# <div class="row">
#   <% @team_a.map(&:avatar).each do | player | %>
# <div class="col s2">
#   <%= image_tag player.url(:med) %>
# </div>
# <% end %>

#   <% @team_a.map(&:username).each do | player | %>
# <div class="col s2">
#   <%= player %>
# </div>
# <% end %>
# </div>

# <%= image_tag "green-shirt.png", :class => "jerseys" %>












