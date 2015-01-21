class BattleState
  @@redis = Redis.new

  @@ACT_GU = 0
  @@ACT_CH = 1
  @@ACT_PA = 2

  @@DRAW  =  0
  @@WIN   =  1
  @@LOSE  = -1


  # redisで登録する？
  @@STATE_MAP = [
  #  グー    チョキ   パー
    [@@DRAW, @@WIN,  @@LOSE],  # グー
    [@@LOSE, @@DRAW, @@WIN ],  # チョキ
    [@@WIN,  @@LOSE, @@DRAW],  # パー
  ]

  # nameに一意制約
  def init_params(player_name)
    p = Player.find_by(name: player_name)
    @@redis.set(player_name, {name: player_name, max_hp: p.hp, hp: p.hp, atk: p.atk, dif: p.dif}.to_json)
    self.get_params(player_name)
  end

  def set_params(params={})
    # p = Player.find_by(name: params["name"])
    p params
    @@redis.set(params["name"], params.to_json)
  end

  def del_params(name)
    @@redis.del(name)
  end

  def get_params(name)
    json = @@redis.get(name)
    JSON.parse(json)
  end

  def check_attack(atk_act, dif_act)
    return @@STATE_MAP[atk_act -1][dif_act -1]
  end

  def battle_sequence(atk_arr, dif_arr)
    check_arr = []
    atk_arr.each_with_index do |atk, idx|
      result = check_attack(atk, dif_arr[idx])
      check_arr << result
      break if result == @@LOSE
    end
    return check_arr
  end

  # デモ用
  # def demo(your_name, enemy_name)
  #   p self.init_params(your_name)
  #   p self.init_params(enemy_name)

  #   p you = self.get_params(your_name)
  #   p enemy = get_params(enemy_name)

  #   offense_player = your_name
  #   defence_player = enemy_name

  #   while you["hp"] > 0 && enemy["hp"] > 0 do
  #   # while 1 do
  #     puts "\n[#{offense_player}の攻撃ターン]"
  #     puts "input 1-3"

  #     combo = 5
  #     # your_act  = Array.new(combo).map{ (gets.to_i) -1 }
  #     your_act  = (gets.split(" ")).map{ |i| i.to_i-1}
  #     enemy_act = Array.new(combo).map{ rand(3) }

  #     results = battle_sequence(your_act, enemy_act)

  #     results.each do |result|
  #       case result
  #       when @@WIN
  #         you["hp"] = you["hp"]-1   if defence_player == you["name"]
  #         enemy["hp"] = enemy["hp"]-1 if defence_player == enemy["name"]

  #         puts "攻撃がヒット！"
  #         puts "  #{you["name"]}(HP: #{you["hp"]})"
  #         puts "  #{enemy["name"]}(HP: #{enemy["hp"]})"
  #       when @@DRAW
  #         puts "攻撃を防がれた！"
  #       when @@LOSE
  #         puts "攻撃失敗！攻守交代！"
  #         offense_player, defence_player = defence_player, offense_player
  #         break
  #       end
  #     end
  #   end
  #   puts "YOU WIN!"  if enemy["hp"] < 0
  #   puts "YOU LOSE!" if you["hp"] < 0
  # end
end
