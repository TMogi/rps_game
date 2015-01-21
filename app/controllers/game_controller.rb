class GameController < ApplicationController
  # def start
  #   battle = BattleState.new
  #   # player1 = Player.find_by('p1')
  #   # player2 = Player.find_by('p2')
  # end
  def main
  end

  def init
    b = BattleState.new
    b.init_params(params[:player])
    b.init_params(params[:enemy])
    @player = b.get_params(params[:player])
    @enemy = b.get_params(params[:enemy])

    @offense_player = @player["name"]
    @defence_player = @enemy["name"]

    # redirect_to('/')
    render :action => 'battle'
  end

  def battle
    b = BattleState.new
    @player = b.get_params(params[:player])
    @enemy = b.get_params(params[:enemy])

    @offense_player = params[:offense]
    @defence_player = params[:defence]
  end

  def processing
    b = BattleState.new
    @player = b.get_params(params[:player])
    @enemy = b.get_params(params[:enemy])

    your_act  = params["act"].map{|k,v| v.to_i}
    enemy_act = Array.new(your_act.length).map{ rand(3) }

    @offense_player = params[:offense]
    @defence_player = params[:defence]

    @results = b.battle_sequence(your_act, enemy_act)
    render :action => 'battle'
  end

  def show
    render :json => {hoge: "hoge"}
  end
end
